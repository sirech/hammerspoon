local screens = hs.screen.allScreens()

local screenwatcher = hs.screen.watcher.new(function()
    screens = hs.screen.allScreens()
end)
screenwatcher:start()

local function moveTo(win, x)
    for id, screen in pairs(screens) do
        if id == x then
            win:moveToScreen(screen)
        end
    end
end

return {
    moveTo = moveTo
}
