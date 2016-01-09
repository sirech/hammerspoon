local application = require "hs.application"
local hotkey = require 'hs.hotkey'

local function module_init()
    triggers = {
        { "1", "Emacs"},
        { "2", "iTerm"},
        { "3", "Google Chrome"},
        { "4", "Chromium"},
        { "5", "Mail"},
        { "6", "HipChat"},
        { "7", "Calendar"},
    }

    for _, trigger in ipairs(triggers) do
        local mash = config:get('fullscreen.mash', { "cmd", "ctrl", "alt" })
        local key = trigger[1]
        local applicationName = trigger[2]

        hotkey.bind(mash, key, function()
                        application.launchOrFocus(applicationName)
        end)
    end
end

return {
    init = module_init
}
