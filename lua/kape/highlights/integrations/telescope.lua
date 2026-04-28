local M = function(p, opts)
	local surface0 = opts.transparent and "NONE" or p.surface0
	local surface1 = opts.transparent and "NONE" or p.surface1
	local highlights = {

		-- Layout
		TelescopeNormal = { fg = p.foreground, bg = surface0 },
		TelescopeBorder = { fg = p.surface2, bg = surface0 },
		TelescopeTitle = { fg = p.background, bg = p.yellow, bold = true },
		TelescopePromptNormal = { fg = p.foreground, bg = surface1 },
		TelescopePromptBorder = { fg = p.surface2, bg = surface1 },
		TelescopePromptTitle = { fg = p.background, bg = p.red, bold = true },
		TelescopePromptPrefix = { fg = p.red, bg = surface1 },
		TelescopePromptCounter = { fg = p.third_text, bg = surface1 },
		TelescopePreviewNormal = { fg = p.foreground, bg = surface0 },
		TelescopePreviewBorder = { fg = p.surface2, bg = surface0 },
		TelescopePreviewTitle = { fg = p.background, bg = p.green, bold = true },
		TelescopeResultsNormal = { fg = p.foreground, bg = surface0 },
		TelescopeResultsBorder = { fg = p.surface2, bg = surface0 },
		TelescopeResultsTitle = { fg = surface0, bg = surface0 },

		-- Selection & Matching
		TelescopeSelection = { fg = p.foreground, bg = p.surface2, bold = true },
		TelescopeSelectionCaret = { fg = p.yellow, bg = p.surface2 },
		TelescopeMultiSelection = { fg = p.cyan, bg = surface1 },
		TelescopeMultiIcon = { fg = p.cyan },
		TelescopeMatching = { fg = p.yellow, bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
