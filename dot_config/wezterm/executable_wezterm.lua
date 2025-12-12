local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 120
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.tab_max_width = 17
config.initial_cols = 135
config.initial_rows = 35

config.enable_kitty_graphics = true

-- config.font = wezterm.font("AnonymicePro Nerd Font", {weight = 'Regular'}) 
-- config.font = wezterm.font("GeistMono NF", {weight = 'Regular', italic=false})
-- config.font = wezterm.font("SpaceMono Nerd Font")
config.font = wezterm.font("ZedMono NF", {weight = 'Medium'})
-- config.font = wezterm.font("IosevkaTerm NF") 
config.freetype_load_target = "Normal" -- Can be "Normal", "Light", "Mono", "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd" -- Can be "Normal", "Light", "Mono", "HorizontalLcd"
config.cell_width = 1.0
-- config.cell_width = 1.1
-------------------------------------------

config.window_background_opacity = 0.50
config.enable_wayland = true

if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" or
   os.getenv("XDG_SESSION_DESKTOP") == "hyprland" then
    config.enable_wayland = false
end




-- config.enable_wayland = false
config.prefer_egl = true

-------------------------------------------
config.font_size = 10.7
config.line_height = 1.0
-------------------------------------------
-- config.line_height = 1.0
-- config.font_size = 11.0
-------------------------------------------

local padding = 8

config.window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}
config.window_frame = {
	font = wezterm.font({ family = "ZedMono NF", weight = "Regular"}),
	font_size = 10,
	-- active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}





config.colors = {
    -- terminal background + text
    foreground = "#dddddd",
    background = "#111111",

    -- cursor
    cursor_bg = "#dddddd",
    cursor_fg = "#000000",

    -- selection
    selection_bg = "#333333",
    selection_fg = "#dddddd",

    -- scroll thumb
    scrollbar_thumb = "#444444",

    -- tab bar styled like your tmux status bar
    tab_bar = {
        background = "#111111",  -- status-style bg=#111111

        active_tab = {
            bg_color = "#333333", -- window-status-current-style bg=#333333
            fg_color = "#dddddd", -- fg=white
            intensity = "Half",
            italic = false,
        },

        inactive_tab = {
            bg_color = "#222222", -- window-status-style bg=#222222
            fg_color = "#dddddd",
            intensity = "Half",
        },

        inactive_tab_hover = {
            bg_color = "#333333", -- hover same as current style
            fg_color = "#dddddd",
            intensity = "Half",
        },

        new_tab = {
            bg_color = "#111111",
            fg_color = "#dddddd",
        },

        new_tab_hover = {
            bg_color = "#222222",
            fg_color = "#dddddd",
        },
    },
}




-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "RESIZE"
-- config.window_decorations = "NONE | RESIZE"




-- tabs
-- config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

wezterm.on("update-right-status", function(window, _)
  local time = wezterm.strftime("%Y-%m-%d %H:%M:%S")

  window:set_right_status(
    wezterm.format({
      { Foreground = { Color = "#aaaaaa" } },
      { Text = " " .. time .. " " },
    })
  )
end)

-- wezterm.on("update-status", function(window, pane)
-- 	-- local date = wezterm.strftime("%I:%M%p :: %m-%d-%Y")
-- 	window:set_left_status(wezterm.format({
-- 		{
--             -- Text = " " .. date .. " ",
--             Text = " " .. "shrey..." .. " ",
--         },
-- 	}))
-- end)
--


config.keys = {
    {key="[", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="]", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},

    {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="h", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="l", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="h", mods="ALT|SHIFT", action=wezterm.action{SplitHorizontal = { domain = "CurrentPaneDomain" }}},
    {key="v", mods="ALT|SHIFT", action=wezterm.action{SplitVertical = { domain = "CurrentPaneDomain" }}},

    {key="\\", mods="CTRL", action=wezterm.action.SpawnTab 'DefaultDomain'},
    {key="|", mods="CTRL|SHIFT", action=wezterm.action.CloseCurrentTab{ confirm = true }},

	{key = "\\", mods = "CTRL|ALT",
    action = wezterm.action_callback(function(window, _)
        local overrides = window:get_config_overrides() or {}
        if overrides.window_background_opacity == 1.0 then
            overrides.window_background_opacity = 0.5
            overrides.background = {}

        else
            overrides.window_background_opacity = 1.0
            -- overrides.background = {
            --     {
            --         source = {
            --             File = '/home/shrey/Documents/wallpapers/a_group_of_purple_flowers.jpg',
            --         },
            --         attachment = "Fixed",
            --         hsb = { brightness = 0.7 },
            --     }
            -- }
        end
        window:set_config_overrides(overrides)
    end),
	},
  }

return config
