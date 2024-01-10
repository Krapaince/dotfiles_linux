-- {{@@ header() @@}}

local wezterm = require('wezterm')

require('tab-title')

local config = {
  automatically_reload_config = true,
  font = wezterm.font('Iosevka Term Extended'),
  font_size = 8,
  line_height = 1,
  cell_width = 0.8,
  hide_tab_bar_if_only_one_tab = true,
  switch_to_last_active_tab_when_closing_tab = true,
  use_fancy_tab_bar = false,
  scrollback_lines = 5000,

  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  keys = require('keys'),
  window_background_opacity = 0.9,
}

return config
