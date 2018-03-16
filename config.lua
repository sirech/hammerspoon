local config = {}

config.modules = {
    -- "arrangement",
    "monitors",
    "repl",
    "reload",
    "arrows",
    -- "lock",
    -- "fullscreen",
    "triggers",
    "mappings",
    -- "capslock"
}

local leader = {"cmd", "ctrl", "alt", "shift"};

-- Maps monitor id -> screen index.
config.monitors = {
    mash = leader,
    key = "e"
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

config.repl = {
    mash = leader,
    key = '='
}

return config
