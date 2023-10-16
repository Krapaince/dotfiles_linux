-- {{@@ header() @@}}

local wezterm = require('wezterm')

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local foreground = 'black'
  local main_color = wezterm.color.parse('#bf8300')
  local edge_background = main_color:darken(0.7)
  local background = main_color:darken(0.3)
  if tab.is_active then
    background = main_color
  end

  wezterm.log_warn(wezterm.gui.screens().virtual_width)

  local title = ' ' .. tab.tab_index .. ' '
  title = wezterm.truncate_right(title, max_width - 2)

  local tab_title = {
    { Background = { Color = edge_background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' },

    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },

    { Background = { Color = edge_background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' },
  }

  if tab.tab_index ~= 0 then
    table.insert(tab_title, 1, { Background = { Color = 'black' } })
    table.insert(tab_title, 2, { Foreground = { Color = 'black' } })
    table.insert(tab_title, 3, { Text = ' ' })
    table.insert(tab_title, { Background = { Color = 'black' } })
    table.insert(tab_title, { Foreground = { Color = 'black' } })
    table.insert(tab_title, { Text = ' ' })
  end

  return tab_title
end)

return {}
