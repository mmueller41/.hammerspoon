---------------
-- Warp application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem

local Warp = Application:new("Warp")

Warp.newWin = Application:createMenuItemAction({ "File", "New Window" }, {focusBefore = true})
Warp.newTab = Application:createMenuItemAction({ "File", "New Tab" }, {focusBefore = true})

Warp:registerShortcuts({
    { nil, "n", Warp.newWin, "New Window" },
    { nil, "t", Warp.zotero, "New Tab" },
})

return Warp