local config = {}

config.modules = {
    "arrangement",
    "monitors",
    "repl",
    "reload",
    "arrows",
    "lock",
    "fullscreen",
    "pomodoor",
    "hop"
}

-- Maps monitor id -> screen index.
config.monitors = {
    autodiscover = true,
    rows = 1
}

-- Window arrangements.
local leader = {"cmd", "ctrl", "alt"};

config.arrangements = {
    fuzzy_search = {
        mash = leader,
        key = "Z"
    },
    {
        name = "zen",
        alert = true,
        mash = leader,
        key = "A",
        arrangement = {
            {
                app_title = "^Mail",
                monitor = 1,
                position = "full_screen",
            },
            {
                app_title = "^Slack",
                monitor = 4,
                position = "left"
            },
            {
                app_title = "^Messages",
                monitor = 4,
                position = function(d)
                    return d:translate_from('bottom_right', {
                        y = 42,
                        h = -40
                    })
                end
            },
            {
                app_title = "^ChronoMate",
                monitor = 4,
                position = function(d)
                    return d:translate_from('top_right', {
                        h = 42
                    })
                end
            },
            {
                app_title = "^Spotify",
                monitor = 6,
                position = "full_screen",
            }
        }
    },
    {
        name = "docked",
        alert = true,
        mash = leader,
        key = "1",
        arrangement = {
            {
                app_title = "Outlook",
                monitor = 1,
                position = function(d)
                    local base = d:translate_from('right_two_thirds', {
                    })
                    local strip = base['w']/4
                    base['w'] = strip*5
                    base['x'] = base['x'] - strip
                    return base
                end
            },
            {
                title = "Chrome",
                monitor = 1,
                position = "full_screen"
            },
            {
                title = "Lync",
                monitor = 1,
                position = function(d)
                    local base =  d:translate_from('left_third', {
                    })
                    base['w'] = base['w']/2
                    return base
                end
            },
            {
                app_title = "^ChronoMate",
                monitor = 4,
                position = function(d)
                    return d:translate_from('top_right', {
                        h = 42
                    })
                end
            },
            {
                app_title = "^Spotify",
                monitor = 6,
                position = "full_screen",
            }
        }
    }
}

config.app_selector = {
    mash = leader,
    key = 'tab'
}

config.lock = {
    mash = leader
}

return config
