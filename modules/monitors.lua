local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local geometry = require 'hs.geometry'
local mouse = require 'hs.mouse'

local position = import('utils/position')
local monitors = import('utils/monitors')
local screens = import('utils/screens')

local function init_module()
    local keys = config:get("monitors.keys", {})

    for id, monitor in pairs(monitors.configured_monitors) do
        local key = "PAD" .. id
        if keys[id] ~= nil then
            key = keys[id]
        end

        -- hotkey.bind({ "cmd", "ctrl" }, key, function()
        --     local midpoint = geometry.rectMidPoint(monitor.dimensions)
        --     mouse.setAbsolutePosition(midpoint)
        -- end)

        hotkey.bind(config:get('monitors.mash', { "cmd", "ctrl", "alt" }), key, function()
            local win = window.focusedWindow()

            if win ~= nil then

                local fsChange = win:isFullScreen()

                if fsChange then
                    win:toggleFullScreen()
                    os.execute('sleep 1')
                end

                screens.moveTo(win, id)

                if fsChange then
                    win:toggleFullScreen()
                end
            end
        end)

        -- hotkey.bind({ "ctrl", "alt" }, key, function()
        --     local win = window.focusedWindow()
        --     if win ~= nil then
        --         win:setFrame(position.left(monitor.dimensions))
        --     end
        -- end)

        -- hotkey.bind({ "cmd", "alt" }, key, function()
        --     local win = window.focusedWindow()
        --     if win ~= nil then
        --         win:setFrame(position.right(monitor.dimensions))
        --     end
        -- end)
        -- hotkey.bind({ "shift", "ctrl", "alt" }, key, function()
        --     local win = window.focusedWindow()
        --     if win ~= nil then
        --         win:setFrame(monitor.dimensions:relative_window_position(win))
        --     end
        -- end)
    end
end

return {
    init = init_module
}
