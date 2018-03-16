local hotkey = require 'hs.hotkey'

local function init_module()
    local mash = config:get("monitors.mash")
    local key = config:get("monitors.key", {})

    hotkey.bind(mash, key, function()
                    local cwin = hs.window.focusedWindow()
                    local cscreen = cwin:screen()
                    cwin:moveToScreen(cscreen:next())
    end)
end

return {
    init = init_module
}
