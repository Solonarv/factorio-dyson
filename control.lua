local DysonSwarm = require "dyson_swarm"

require "scripts.receiver"

local function disable_no_satellite_launch_message()
    if remote.interfaces["silo-script"] then
        remote.call("silo-script", "set_show_launched_without_satellite", false)
    end
end

script.on_init(disable_no_satellite_launch_message)
script.on_configuration_changed(disable_no_satellite_launch_message)

local tracked_items = {"dyson-statite", "dyson-swarm-controller"}

local function get_tracked_items()
    return tracked_items
end

script.on_event(defines.events.on_rocket_launched, function(event)
    local rocket = event.rocket
    if not rocket then return end
    local force = rocket.force
    if not force then return end
    for _, item in pairs(get_tracked_items()) do
        if rocket.get_item_count(item) > 0 then
            DysonSwarm.add_launched_item(force, item, rocket.get_item_count(item))
        end
    end
end)