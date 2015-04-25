local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

local position = import('utils/position')
local monitors = import('utils/monitors')

local function module_init()
    local mash = config:get("arrows.mash", { "cmd", "ctrl", "alt" })
    local combos = config:get("arrow.keys", {
        DOWN = {
            RIGHT = "bottom_right",
            LEFT = "bottom_left",
        },
        UP = {
            RIGHT = "top_right",
            LEFT = "top_left",
        },
        RIGHT = {
            DOWN = "bottom_right",
            UP = "top_right",
            LEFT = "full",
        },
        LEFT = {
            DOWN = "bottom_left",
            UP = "top_left",
            RIGHT = "full",
        },
    })
    local combos_ready = nil

    local keys = config:get("arrows.keys", {
        UP = "top",
        DOWN = "bottom",
        LEFT = "left",
        RIGHT = "right",
        -- SPACE = "full",
        PAD8 = "top",
        PAD2 = "bottom",
        PAD4 = "left",
        PAD6 = "right",
        PAD7 = "top_left",
        -- PAD8 = "middle_third",
        PAD9 = "top_right",
        PAD3 = "bottom_right",
        PAD1 = "bottom_left"
    })

    for key, position_string in pairs(keys) do
        local position_fn = position[position_string]

        if position_fn == nil then
            error("arrow: " .. position_string .. " is not a valid position")
        end

        hotkey.bind(mash, key, function()
            local win = window.focusedWindow()
            if win == nil then
                return
            end

            local screen = win:screen()
            local newframe
            local dimensions = monitors.get_screen_dimensions(screen)

            local newframe
            if combos_ready ~= nil then
                -- finish combo
                local position_fn2 = position[combos_ready[key]]
                newframe = position_fn2(dimensions)
            elseif combos[key] ~= nil then
                -- start combo
                combos_ready = combos[key]
                newframe = position_fn(dimensions)
            else
                -- no combo
                newframe = position_fn(dimensions)
            end

            win:setFrame(newframe)
        end,
        function()
            combos_ready = nil
        end)

    end

end

return {
    init = module_init
}
