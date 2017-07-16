local application = require 'hs.application'
local hotkey = require 'hs.hotkey'
local eventtap = require 'hs.eventtap'

local ignoredApps = function()
    t = {}
    t["Emacs"] = true
    t["iTerm2"] = true
    return t
end

local browserApps = function()
    t = {}
    t["Google Chrome"] = true
    t["Chromium"] = true
    t["Firefox"] = true
    t["Safari"] = true
    return t
end

local currentApp = function()
    local app = application.frontmostApplication()
    return app:title()
end

local trigger = function(key)
    eventtap.keyStroke({ 'cmd' }, key)
end

local conditionalTrigger = function(key, accepted, ignored)
    local app = currentApp()

    if ignored[app] then
        return
    end

    if accepted and not accepted[app] then
        return
    end

    trigger(key)
end

local rebind = function(key, accepted, ignored)
    hotkey.bind({ "ctrl" }, key, nil, function() conditionalTrigger(key, accepted, ignored) end)
end

return {
    init = function()
        local ignored = ignoredApps()
        local browsers = browserApps()

        -- Copy / Paste
        rebind("C", nil, ignored)
        rebind("V", nil, ignored)
        rebind("X", nil, ignored)

        -- Save
        rebind("S", nil, ignored)

        -- New
        rebind("N", nil, ignored)

        -- New tab
        rebind("T", nil, ignored)

        -- Find
        rebind("F", nil, ignored)
        rebind("G", nil, ignored)

        -- Close
        rebind("W", nil, ignored)

        -- Browser only
        rebind("L", browsers, ignored)
        rebind("D", browsers, ignored)
        rebind("R", browsers, ignored)

    end
}
