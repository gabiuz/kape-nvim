-- lua/lualine/themes/kape.lua
-- Configure lualine with: options = { theme = "kape" }

local p = require("kape.palette").load()

return {
	normal = {
		a = { bg = p.accent3, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	insert = {
		a = { bg = p.accent4, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	visual = {
		a = { bg = p.accent6, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	replace = {
		a = { bg = p.accent1, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	command = {
		a = { bg = p.accent5, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	terminal = {
		a = { bg = p.accent6, fg = p.background, gui = "bold" },
		b = { bg = p.dimmed5, fg = p.text },
		c = { bg = p.dark1,   fg = p.dimmed2 },
	},
	inactive = {
		a = { bg = p.dark1,   fg = p.dimmed3 },
		b = { bg = p.dark1,   fg = p.dimmed3 },
		c = { bg = p.dark1,   fg = p.dimmed3 },
	},
}
