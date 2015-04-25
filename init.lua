local alert = require 'hs.alert'

import = require('utils/import')
import.clear_cache()

config = import('config')

function config:get(key_path, default)
    local root = self
    for part in string.gmatch(key_path, "[^\\.]+") do
        root = root[part]
        if root == nil then
            return default
        end
    end
    return root
end

local modules = {}

for _, v in ipairs(config.modules) do
    local module_name = 'modules/' .. v
    local module = import(module_name)

    if type(module.init) == "function" then
        module.init()
    end

    table.insert(modules, module)
end

local buf = {}

if hs.wasLoaded == nil then
    hs.wasLoaded = true
    table.insert(buf, "Hammerspoon loaded: ")
else
    table.insert(buf, "Hammerspoon re-loaded: ")
end

table.insert(buf, #modules .. " modules.")

alert.show(table.concat(buf))

-- Hints!
hs.hints.fontSize = 16
hs.hints.style = 'vimperator'
hs.hints.showTitleThresh = 10
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    hs.hints.windowHints()
end)
--

-- Opens a new application window in the current space
function bindNewWin(leader, key, appName, menuItemName)
  hs.hotkey.bind(leader, key, function()
    local app = hs.appfinder.appFromName(appName)

    if app ~= nil then
      local currWin = app:mainWindow()
      app:selectMenuItem(menuItemName)

      -- Wait until the window opens
      local tries = 0
      repeat
        os.execute("sleep 0.1")
        tries = tries + 1
      until currWin ~= app:mainWindow() or tries > 5
    end

    hs.application.launchOrFocus(appName)
  end)
end

bindNewWin({ "cmd" }, "return", "iTerm", "New Window" )
hs.hotkey.bind({ "cmd" }, 'T', function () hs.application.launchOrFocus("Trello X") end)
