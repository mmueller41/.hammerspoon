----------------------------------------------------------------------------------------------------
-- Main init file
--
require("table")

-- Start IPC module
require("hs.ipc")

-- Reload Hammerspoon hotkey
hs.hotkey.bind({ "alt", "cmd", "ctrl" }, "r", function()
    hs.console.clearConsole()
    hs.reload()
end)

-- Disable window animation
--hs.window.animationDuration = 0

----------------------------------------------------------------------------------------------------
-- Load, initialize, and configure Ki
--
hs.loadSpoon("Ki")

PaperWM = hs.loadSpoon("PaperWM")
PaperWM.window_gap = 12
PaperWM:bindHotkeys({
    -- switch to a new focused window in tiled grid
    focus_left  = {{"cmd", "alt"}, "left"},
    focus_right = {{"cmd", "alt"}, "right"},
    focus_up    = {{"cmd", "alt"}, "up"},
    focus_down  = {{"cmd", "alt"}, "down"},

    -- move windows around in tiled grid
    swap_left  = {{"cmd", "alt", "shift"}, "left"},
    swap_right = {{"cmd", "alt", "shift"}, "right"},
    swap_up    = {{"cmd", "alt", "shift"}, "up"},
    swap_down  = {{"cmd", "alt", "shift"}, "down"},

    -- position and resize focused window
    center_window = {{"cmd", "alt"}, "c"},
    align_left    = {{"cmd", "alt"}, "h"},
    align_right   = {{"cmd", "alt"}, "l"},
    full_width    = {{"cmd", "alt"}, "f"},
    cycle_width   = {{"cmd", "alt"}, "r"},
    cycle_height  = {{"cmd", "alt", "shift"}, "r"},

    -- move focused window into / out of a column
    slurp_in = {{"cmd", "alt"}, "i"},
    barf_out = {{"cmd", "alt"}, "o"},

    -- switch to a new Mission Control space
    switch_space_1 = {{"cmd", "alt"}, "1"},
    switch_space_2 = {{"cmd", "alt"}, "2"},
    switch_space_3 = {{"cmd", "alt"}, "3"},
    switch_space_4 = {{"cmd", "alt"}, "4"},
    switch_space_5 = {{"cmd", "alt"}, "5"},
    switch_space_6 = {{"cmd", "alt"}, "6"},
    switch_space_7 = {{"cmd", "alt"}, "7"},
    switch_space_8 = {{"cmd", "alt"}, "8"},
    switch_space_9 = {{"cmd", "alt"}, "9"},

    -- move focused window to a new space and tile
    move_window_1 = {{"cmd", "alt", "shift"}, "1"},
    move_window_2 = {{"cmd", "alt", "shift"}, "2"},
    move_window_3 = {{"cmd", "alt", "shift"}, "3"},
    move_window_4 = {{"cmd", "alt", "shift"}, "4"},
    move_window_5 = {{"cmd", "alt", "shift"}, "5"},
    move_window_6 = {{"cmd", "alt", "shift"}, "6"},
    move_window_7 = {{"cmd", "alt", "shift"}, "7"},
    move_window_8 = {{"cmd", "alt", "shift"}, "8"},
    move_window_9 = {{"cmd", "alt", "shift"}, "9"}
})

PaperWM.rejectedApps = {
    "DockMate", 
    "Shadow of the Tomb Raider", 
    "iStat Menus Status", 
    "Fantastical Helper",
    "Rise of the Tomb Raider™"
}

for k, app in pairs(PaperWM.rejectedApps) do 
    PaperWM.window_filter:rejectApp(app)
end

PaperWM.window_ratios = { 0.1458, 0.23607, 0.38195, 0.5,  0.61804, 0.75, 0.84511 }
PaperWM.swipe_fingers = 4
PaperWM.swipe_gain = 1.2
PaperWM:start()

local Ki = spoon.Ki

-- Use default config
Ki:useDefaultConfig()

-- Configure ki
require("ki-config")

-- Use local config if it exists
local _, err = pcall(function() require("local-ki-config") end)
if err and not err:find("module '.*' not found") then
    print("Error loading local ki config: "..err)
end

-- Start Ki
Ki:start()

local spaces = require('spaceman/spaces')
local spaceIndicator = require('spaceman/space-indicator')

spaces.insertRemoveSpaceCallback = spaceIndicator.render
spaces.init()
spaceIndicator.init()
