---------------
-- Arc application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem

local Arc = Application:new("Arc")

Arc.cmdBar = Application:createMenuItemAction({ "File", "Open Command Bar" }, {focusBefore = true})
Arc.zotero = Application:createMenuItemAction({ "Extensions", "Zotero Connector" }, {focusBefore = true})
Arc.sciSpace = Application:createMenuItemAction({ "Extensions", "SciSpace Copilot" }, {focusBefore = true})

Arc:registerShortcuts({
    { nil, "o", Arc.cmdBar, "Open Command Bar" },
    { nil, "z", Arc.zotero, "Zotero Connector" },
    { nil, "s", Arc.sciSpace, "SciSpace Copilot"},
})

return Arc