local DysonSwarm = require "dyson_swarm"

local function BuiltEntity(event)
    local entity = event.created_entity
    if entity.name == "microwave-power-receiver" then
        DysonSwarm.register_receiver(entity)
    end
end

local function MinedEntity(event)
    local entity = event.entity
    if entity.name == "microwave-power-receiver" then
        DysonSwarm.unregister_receiver(entity)
    end
end

script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
script.on_event(defines.events.on_pre_player_mined_item , MinedEntity)
script.on_event(defines.events.on_entity_died , MinedEntity)
script.on_event(defines.events.on_robot_pre_mined , MinedEntity)