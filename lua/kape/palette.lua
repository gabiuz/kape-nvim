-- lua/kape/palette.lua
-- Accent names (red, green, yellow…) and "brights" keep Kape's identity.

local M = {}

M.palette = {
	-- Background scale 
	bg0  = "#181616", 
	bg1  = "#1e1b1b", 
	bg2  = "#2e2a2a", 
	bg3  = "#3a3535", 
	none = "NONE",

	-- Foreground scale 
	fg0   = "#d4be98", 
	fg1   = "#bdae8b", 
	grey0 = "#928374", 
	grey1 = "#928374", 
	grey2 = "#a89984", 

	-- Accent colors — Kape's palette
	red    = "#b53535",
	orange = "#c87941",
	yellow = "#e7bb5c",
	green  = "#b4c76e",
	cyan   = "#72c4b8", 
	blue   = "#7b8fd4",
	violet = "#b072e6", 
	white  = "#c2c2c2",

	-- Bright accents 
	bright_red    = "#c94040",
	bright_orange = "#d4975a",
	bright_yellow = "#f0cc7a",
	bright_green  = "#cad98a",
	bright_blue   = "#9aaae0",
	bright_cyan   = "#90d4ca",
	bright_violet = "#c48ef0",
	bright_white  = "#d4be98",

	-- Visual / diff tinted backgrounds 
	bg_visual_red    = "#3c1f1e",
	bg_visual_yellow = "#3a2e1a",
	bg_visual_green  = "#2a3120",
	bg_visual_blue   = "#1e2b30",
	bg_visual_violet = "#2e1e30",

	bg_diff_red   = "#3c1f1e",
	bg_diff_green = "#2a3120",
	bg_diff_blue  = "#1e2b30",
}

return M
