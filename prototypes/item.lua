data:extend{
    {
        type = "item",
        name = "dyson-statite",
        icon = "__base__/graphics/icons/satellite.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "m[dyson-swarm]-h[statite]",
        stack_size = 5
    },
    {
        type = "item",
        name = "dyson-swarm-controller",
        icon = "__base__/graphics/icons/rocket-control-unit.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "m[dyson-swarm]-f[controller]",
        stack_size = 1,
        rocket_launch_product = {"microwave-power-receiver", 1},
    },
    {
        type = "item",
        name = "microwave-power-receiver",
        icon = "__base__/graphics/icons/roboport.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "energy",
        order = "j[dyson-energy]-a[receiver]",
        stack_size = 10,
        place_result = "microwave-power-receiver"
    },
    {
        type = "item",
        name = "ultra-light-solar-panel",
        icon = "__base__/graphics/icons/solar-panel.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "m[dyson-swarm]-g[ultra-light-solar]",
        stack_size = 50,
    },
    {
        type = "item",
        name = "microwave-power-transmitter",
        icon = "__base__/graphics/icons/beacon.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "m[dyson-swarm]-e[power-transmitter]",
        stack_size = 10
    }
}