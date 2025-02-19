-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-mocha'

config.default_domain = 'WSL:Ubuntu'
-- config.default_prog = { 'powershell.exe' }

config.window_background_opacity = 0.85

-- Config keys
config.keys = {
  { key = 'l', mods = 'CTRL | ALT', action = wezterm.action.ShowLauncher },
  {
    key = 'o',
    mods = 'CTRL | ALT',
    action = wezterm.action_callback(function(window, _)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity == 1.0 then
        overrides.window_background_opacity = 0.9
      else
        overrides.window_background_opacity = 1.0
      end
      window:set_config_overrides(overrides)
    end),
  },
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {workspace = 'coding'})
  window:gui_window():maximize()
  pane:split { size = 0.05 }
end)

-- and finally, return the configuration to wezterm
return config
