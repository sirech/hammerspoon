local function module_init()
    hs.loadSpoon("MiroWindowsManager")
    local mash = config:get("arrows.mash")
    spoon.MiroWindowsManager:bindHotkeys({
            up = {mash, "up"},
            right = {mash, "right"},
            down = {mash, "down"},
            left = {mash, "left"},
            fullscreen = {mash, "f"}
    })
end

return {
    init = module_init
}
