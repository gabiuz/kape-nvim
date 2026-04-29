-- lua/lualine/themes/kape.lua
-- Configure lualine with: options = { theme = "kape" }

local p = require("kape.palette").palette

return {
	normal = {
		a = { bg = p.yellow,  fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	insert = {
		a = { bg = p.green,   fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	visual = {
		a = { bg = p.violet,  fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	replace = {
		a = { bg = p.red,     fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	command = {
		a = { bg = p.cyan,    fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	terminal = {
		a = { bg = p.violet,  fg = p.bg0,   gui = "bold" },
		b = { bg = p.bg2,     fg = p.fg0 },
		c = { bg = p.bg1,     fg = p.fg1 },
	},
	inactive = {
		a = { bg = p.bg1,     fg = p.grey0 },
		b = { bg = p.bg1,     fg = p.grey0 },
		c = { bg = p.bg1,     fg = p.grey0 },
	},
}
