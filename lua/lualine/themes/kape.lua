-- lua/lualine/themes/kape.lua
-- Configure lualine with: options = { theme = "kape" }

local p = require("kape.palette").load()
local config = require("kape.config").get()
local transparent = config.transparent

local function bg(color)
	if transparent then
		return "NONE"
	end

	return color
end

return {
	normal = {
		a = { bg = bg(p.accent3), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	insert = {
		a = { bg = bg(p.accent4), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	visual = {
		a = { bg = bg(p.accent6), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	replace = {
		a = { bg = bg(p.accent1), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	command = {
		a = { bg = bg(p.accent5), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	terminal = {
		a = { bg = bg(p.accent6), fg = p.background, gui = "bold" },
		b = { bg = bg(p.dimmed5), fg = p.text },
		c = { bg = bg(p.dark1),   fg = p.dimmed2 },
	},
	inactive = {
		a = { bg = bg(p.dark1),   fg = p.dimmed3 },
		b = { bg = bg(p.dark1),   fg = p.dimmed3 },
		c = { bg = bg(p.dark1),   fg = p.dimmed3 },
	},
}
