-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-mocha'

config.default_domain = 'WSL:Ubuntu'

-- Config keys
config.keys = {
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {workspace = 'coding'})
  window:gui_window():maximize()
  pane:split { size = 0.05 }
end)

-- and finally, return the configuration to wezterm
return config
