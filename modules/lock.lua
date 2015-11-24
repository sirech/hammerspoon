local hotkey = require 'hs.hotkey'

local function module_init()
    local mash = config:get("lock.mash", {"cmd"})
    local key = config:get("lock.key", "L")

    hotkey.bind(mash, key, function()
        hs.caffeinate.lockScreen()
    end)

end

return {
    init = module_init
}
