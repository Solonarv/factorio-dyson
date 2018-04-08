data:extend{
    {
        type = "recipe",
        name = "ultra-light-solar-panel",
        ingredients =
        {
            {"low-density-structure", 5},
            {"advanced-circuit", 2},
        },
        energy_required = 20,
        result = "ultra-light-solar-panel",
        enabled = false
    },
    {
        type = "recipe",
        name = "microwave-power-transmitter",
        ingredients =
        {
            {"copper-cable", 30},
            {"steel-plate", 5},
            {"plastic-bar", 5},
            {"processing-unit", 2}
        },
        energy_required = 30,
        result = "microwave-power-transmitter",
        enabled = false
    },
    {
        type = "recipe",
        name = "dyson-statite",
        ingredients =
        {
            {"low-density-structure", 4},
            {"radar", 1},
            {"ultra-light-solar-panel", 4},
            {"microwave-power-transmitter", 1}
        },
        energy_required = 5,
        result = "dyson-statite",
        enabled = false
    },
    {
        type = "recipe",
        name = "dyson-swarm-controller",
        ingredients =
        {
            {"low-density-structure", 20},
            {"radar", 1},
            {"solar-panel", 5},
            {"microwave-power-transmitter", 50},
            {"battery", 20},
            {"processing-unit", 20}
        },
        energy_required = 120,
        result = "dyson-swarm-controller",
        enabled = false
    }
}