local new_swarm = function(force)
    return {
        force = force,
        launched_components = {}
    }
end

local get_swarm = function(force)
    if not global.swarms then global.swarms = {} end
    if not global.swarms[force] then global.swarms[force] = new_swarm(force) end
    return global.swarms[force]
end

local add_launched_item = function(force, item, count)
    local swarm = get_swarm(force)
    local launched = swarm.launched_components
    launched[item] = launched[item] or 0
    launched[item] = launched[item] + count
end

local default_component_data = {
    ["dyson-statite"] = 5000000 -- 5 MW
}

local get_power_production = function(item)
    if not global.component_data then global.component_data = default_component_data end
    local component_data = global.component_data[item]
    if component_data then
        return component_data.power_output
    else
        return 0
    end
end

local get_swarm_power = function(force)
    local swarm = get_swarm(force)
    local launched = swarm.launched_components
    local power = 0
    for item, amount in pairs(launched) do
        power = power + amount * get_power_production(item)
    end
end

return {
    get_swarm = get_swarm,
    add_launched_item = add_launched_item,
    get_swarm_power = get_swarm_power,
    get_power_production
}