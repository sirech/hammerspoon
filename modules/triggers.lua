local application = require "hs.application"
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local geometry = require 'hs.geometry'
local mouse = require 'hs.mouse'

local function module_init()
    triggers = {
        { "1", "Emacs"},
        { "2", "iTerm"},
        { "3", "Google Chrome"},
        { "4", "Chromium"},
        { "M", "Mail"},
        { "H", "HipChat"},
        { "C", "Calendar"},
        { "X", "xScope"},
    }

    for _, trigger in ipairs(triggers) do
        local mash = config:get('fullscreen.mash', { "cmd", "ctrl", "alt" })
        local key = trigger[1]
        local applicationName = trigger[2]

        hotkey.bind(mash, key, function()
                        application.launchOrFocus(applicationName)
                        local midpoint = geometry.rectMidPoint(window.focusedWindow():frame())
                        mouse.setAbsolutePosition(midpoint)
        end)
    end
end

return {
    init = module_init
}
