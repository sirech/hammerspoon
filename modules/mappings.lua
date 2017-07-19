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
    remap('Z'),
}

local interactionBinds = {
    remap('S'),
    remap('N'),
    remap('T'),
    remap('F'),
    remap('G'),
}

local browserBinds = {
    remap('L'),
    remap('D'),
    remap('R'),
}

local closeBinds = {
    remap('W')
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
local apps = { "Finder", "KeePassX", "HipChat", "Preview", "Mailplane 3", "Calendar", "Mail", "Basecamp 3" }

return {
    init = function ()
        for k,v in pairs(browsers) do
            local app = wf.new{v}
            app:subscribe(wf.windowFocused, function()
                                  enableBinds(browserBinds)
                                  enableBinds(interactionBinds)
                                  enableBinds(copyPasteBinds)
                                  enableBinds(closeBinds)
            end)
            app:subscribe(wf.windowUnfocused, function()
                                  disableBinds(browserBinds)
                                  disableBinds(interactionBinds)
                                  disableBinds(copyPasteBinds)
                                  disableBinds(closeBinds)
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
