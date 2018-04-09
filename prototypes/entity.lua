data:extend{
    {
        type = "electric-energy-interface",
        name = "microwave-power-receiver",
        icon = "__base__/graphics/icons/accumulator.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "electric-energy-interface"},
        max_health = 150,
        corpse = "medium-remnants",
        collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
        selection_box = {{-1, -1}, {1, 1}},
        enable_gui = false,
        allow_copy_paste = false,
        energy_source =
        {
        type = "electric",
        buffer_capacity = "10GJ",
        usage_priority = "terciary",
        input_flow_limit = "0kW",
        output_flow_limit = "500GW"
        },

        energy_production = "500GW",
        energy_usage = "0kW",
        -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
        picture =
        {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        priority = "extra-high",
        width = 124,
        height = 103,
        shift = {0.6875, -0.203125},
        tint = {r=1, g=0.8, b=1, a=1}
        },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
        working_sound =
        {
        sound =
        {
            filename = "__base__/sound/accumulator-working.ogg",
            volume = 1
        },
        idle_sound =
        {
            filename = "__base__/sound/accumulator-idle.ogg",
            volume = 0.4
        },
        max_sounds_per_type = 5
        }
    }
}