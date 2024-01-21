-- {{@@ header() @@}}

local wezterm = require('wezterm')
local action = wezterm.action

local mod = 'SUPER'

local keys = {
  { 'SUPER', 'u', action.ScrollByLine(1) },
  { 'SUPER', 'i', action.ScrollByLine(-1) },
  { 'SUPER', 'U', action.ScrollByPage(1) },
  { 'SUPER', 'I', action.ScrollByPage(-1) },
  { 'CTRL', 'C', action.CopyTo('ClipboardAndPrimarySelection') },
  { 'CTRL', 'V', action.PasteFrom('Clipboard') },

  -- Pane
  { mod, 'h', action.ActivatePaneDirection('Left') },
  { mod, 'j', action.ActivatePaneDirection('Down') },
  { mod, 'k', action.ActivatePaneDirection('Up') },
  { mod, 'l', action.ActivatePaneDirection('Right') },
  { 'CTRL|SHIFT', 'h', action.AdjustPaneSize({ 'Left', 1 }) },
  { 'CTRL|SHIFT', 'j', action.AdjustPaneSize({ 'Down', 1 }) },
  { 'CTRL|SHIFT', 'k', action.AdjustPaneSize({ 'Up', 1 }) },
  { 'CTRL|SHIFT', 'l', action.AdjustPaneSize({ 'Right', 1 }) },
  { 'CTRL|ALT', 'Enter', action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { 'CTRL', 'Enter', action.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  { mod .. '|ALT', 'l', action.RotatePanes('Clockwise') },
  { mod .. '|ALT', 'L', action.RotatePanes('CounterClockwise') },
  { mod, 'r', action.PaneSelect({ mode = 'SwapWithActive', alphabet = 'fjdksla;cmrueiwoqp' }) },

  -- Tab
  { 'WIN|SHIFT', 't', action.SpawnTab('CurrentPaneDomain') },
  { mod, 'L', action.ActivateTabRelative(1) },
  { mod, 'H', action.ActivateTabRelative(-1) },
  { mod, 'w', action.CloseCurrentTab({ confirm = false }) },
  { mod, '.', action.MoveTabRelative(1) },
  { mod, ',', action.MoveTabRelative(-1) },

  { 'CTRL|SHIFT', 'o', action.EmitEvent('toggle-opacity') },
}

local function map(tbl, fun)
  local t = {}
  for _, v in ipairs(tbl) do
    table.insert(t, fun(v))
  end
  return t
end

local function intoKeyMap(value)
  return {
    key = value[2],
    mods = value[1],
    action = value[3],
  }
end

return map(keys, intoKeyMap)
