-- lua/kape/highlights/telescope.lua
-- Uses semantic group links where possible.

local M = function(p, opts)
	local bg      = opts.transparent_background and p.none or p.bg0
	local surface = opts.transparent_background and p.none or p.bg1
	local raised  = opts.transparent_background and p.none or p.bg2

	local highlights = {

		-- Layout panels
		TelescopeNormal         = { fg = p.fg0,   bg = surface },
		TelescopeBorder         = { link = "KapeGrey" },
		TelescopeTitle          = { fg = bg, bg = p.yellow,  bold = true },
		TelescopePromptNormal   = { fg = p.fg0,   bg = raised },
		TelescopePromptBorder   = { fg = p.bg3,   bg = raised },
		TelescopePromptTitle    = { fg = bg,      bg = p.red,   bold = true },
		TelescopePromptPrefix   = { link = "KapeOrange" },
		TelescopePromptCounter  = { fg = p.grey0, bg = raised },
		TelescopePreviewNormal  = { fg = p.fg0,   bg = surface },
		TelescopePreviewBorder  = { fg = p.bg3,   bg = surface },
		TelescopePreviewTitle   = { fg = bg,      bg = p.green, bold = true },
		TelescopeResultsNormal  = { fg = p.fg0,   bg = surface },
		TelescopeResultsBorder  = { fg = p.bg3,   bg = surface },
		TelescopeResultsTitle   = { fg = surface, bg = surface },

		-- Selection & matching
		TelescopeSelection      = { link = "DiffAdd" },
		TelescopeSelectionCaret = { fg = p.yellow, bg = p.bg2 },
		TelescopeMultiSelection = { fg = p.cyan,   bg = raised },
		TelescopeMultiIcon      = { fg = p.cyan },
		TelescopeMatching       = { fg = p.green,  bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
