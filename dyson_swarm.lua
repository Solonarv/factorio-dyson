local DysonSwarm = {}

function DysonSwarm.new_swarm(force)
    return {
        force = force,
        launched_components = {},
        receivers = {  },
        receiver_count = 0
    }
end

function DysonSwarm.get_swarm(force_)
    local force = force_.name
    if not global.swarms then global.swarms = {} end
    if not global.swarms[force] then global.swarms[force] = DysonSwarm.new_swarm(force) end
    game.print("Retrieved swarm for force: " .. serpent.block(force))
    return global.swarms[force]
end

function DysonSwarm.add_launched_item(force, item, count)
    local swarm = DysonSwarm.get_swarm(force)
    local launched = swarm.launched_components
    launched[item] = (launched[item] or 0) + count
    if DysonSwarm.get_component_data()[item] then
        DysonSwarm.update_power_production(force)
    end
end

function DysonSwarm.get_component_data()
    if not global.component_data then
        global.component_data = {
            ["dyson-statite"] = {
                power_output = 5000000, -- 0.3 GW = 5 MJ / tick
            }
        }
    end
    return global.component_data
end

function DysonSwarm.get_power_production(item)
    local component_data = DysonSwarm.get_component_data()[item]
    if component_data then
        return component_data.power_output
    else
        return 0
    end
end

function DysonSwarm.update_power_production(force)
    local swarm = DysonSwarm.get_swarm(force)
    local total_power = DysonSwarm.get_swarm_power(force)
    local receivers = swarm.receivers
    if swarm.receiver_count == 0 then return end
    local power = total_power / swarm.receiver_count
    for _, receiver in pairs(receivers) do
        if receiver and receiver.valid and receiver.is_connected_to_electric_network() then
            receiver.power_production = power
            receiver.electric_buffer_size = power
        end
    end
end

function DysonSwarm.get_swarm_power(force)
    local swarm = DysonSwarm.get_swarm(force)
    local launched = swarm.launched_components
    local power = 0
    for item, amount in pairs(launched) do
        power = power + amount * DysonSwarm.get_power_production(item)
    end
    return power
end

function DysonSwarm.register_receiver(entity)
    local swarm = DysonSwarm.get_swarm(entity.force)
    local receivers = swarm.receivers
    if not receivers[entity.unit_number] then
        swarm.receiver_count = swarm.receiver_count + 1
    end
    receivers[entity.unit_number] = entity
    DysonSwarm.update_power_production(entity.force)
end

function DysonSwarm.unregister_receiver(entity)
    local swarm = DysonSwarm.get_swarm(entity.force)
    local receivers = swarm.receivers
    if receivers[entity.unit_number] then
        swarm.receiver_count = swarm.receiver_count - 1
    end
    receivers[entity.unit_number] = nil
    DysonSwarm.update_power_production(entity.force)
end

return DysonSwarm