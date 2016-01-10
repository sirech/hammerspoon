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
    "hop",
    "triggers"
}

local leader = {"cmd", "ctrl", "alt", "shift"};

-- Maps monitor id -> screen index.
config.monitors = {
    autodiscover = true,
    rows = 1,
    mash = leader,
    keys = { "w", "e", "q" }
}

-- Window arrangements.
config.arrangements = {
    {
        name = "reset",
        alert = true,
        mash = leader,
        key = "U",
        arrangement = {
            {
                app_title = "Emacs",
                monitor = 1,
                position = "full"
            },
            {
                app_title = "iTerm",
                monitor = 1,
                position = "full"
            },
            {
                app_title = "Google Chrome",
                monitor = 1,
                position = "full",
                move_all = true
            },
            {
                app_title = "Chromium",
                monitor = 1,
                position = "full",
                move_all = true
            },
        }
    },
    {
        name = "development",
        alert = true,
        mash = leader,
        key = "I",
        arrangement = {
            {
                app_title = "Emacs",
                monitor = 1,
                position = "full_screen",
            },
            {
                app_title = "iTerm",
                monitor = 2,
                position = "full_screen",
            }
        }
    },
}

config.arrows = {
    mash = leader,
    keys = {
        UP = "top",
        DOWN = "bottom",
        LEFT = "left",
        RIGHT = "right",
    }
}

config.lock = {
    mash = leader
}

config.reload = {
    mash = leader
}

config.fullscreen = {
    mash = leader,
    key = 'return'
}

config.triggers = {
    mash = leader
}

return config
