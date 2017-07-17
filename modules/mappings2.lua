local wf = hs.window.filter

function remap (letter)
    return hs.hotkey.new({"ctrl"}, letter, nil, function()
            hs.eventtap.keyStroke({"cmd"}, letter)
    end)
end

local copyPasteBinds = {
    remap('C'),
    remap('V'),
    remap('X'),
}

local interactionBinds = {
    remap('S'),
    remap('N'),
    remap('T'),
    remap('F'),
    remap('G'),
    remap('W'),
}

local browserBinds = {
    remap('L'),
    remap('D'),
    remap('R'),
}

function enableBinds(binds)
    -- hs.console.printStyledtext("term focused")
    for k,v in pairs(binds) do
        v:enable()
    end
end

function disableBinds(binds)
    -- hs.console.printStyledtext("term unfocused")
    for k,v in pairs(binds) do
        v:disable()
    end
end

local browsers = { "Google Chrome", "Chromium", "Firefox", "Safari" }
local apps = { "Finder", "KeePassX" }

return {
    init = function ()
        for k,v in pairs(browsers) do
            local app = wf.new{v}
            app:subscribe(wf.windowFocused, function()
                                  enableBinds(browserBinds)
                                  enableBinds(interactionBinds)
                                  enableBinds(copyPasteBinds)
            end)
            app:subscribe(wf.windowUnfocused, function()
                                  disableBinds(browserBinds)
                                  disableBinds(interactionBinds)
                                  disableBinds(copyPasteBinds)
            end)
        end

        for k,v in pairs(apps) do
            local app = wf.new{v}
            app:subscribe(wf.windowFocused, function()
                                  enableBinds(interactionBinds)
                                  enableBinds(copyPasteBinds)
            end)
            app:subscribe(wf.windowUnfocused, function()
                                  disableBinds(interactionBinds)
                                  disableBinds(copyPasteBinds)
            end)
        end
    end
}
