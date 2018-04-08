data:extend{
    {
        type = "technology",
        name = "dyson-swarm",
        icon_size = 128,
        icon = "__base__/graphics/technology/steel-processing.png",
        effects =
        {
        {
            type = "unlock-recipe",
            recipe = "ultra-light-solar-panel"
        },
        {
            type = "unlock-recipe",
            recipe = "microwave-power-transmitter"
        },
        {
            type = "unlock-recipe",
            recipe = "dyson-statite"
        },
        {
            type = "unlock-recipe",
            recipe = "dyson-swarm-controller"
        }
        },
        unit =
        {
        count = 1000,
        ingredients =
        {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1},
            {"military-science-pack", 1},
            {"production-science-pack", 1},
            {"high-tech-science-pack", 1},
            {"space-science-pack", 1},
        },
        time = 20
        },
        order = "k-a-a"
    }
}