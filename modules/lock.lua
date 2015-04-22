local hotkey = require 'hs.hotkey'

local function module_init()
    local mash = config:get("lock.mash", {"cmd"})
    local key = config:get("lock.key", "L")

    hotkey.bind(mash, key, function()
        -- os.execute("/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend")
        os.execute("/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine")
    end)

end

return {
    init = module_init
}
