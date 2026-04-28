local M = function(p)
	local highlights = {

		-- Layout
		TelescopeNormal = { fg = p.foreground, bg = p.surface0 },
		TelescopeBorder = { fg = p.surface2, bg = p.surface0 },
		TelescopeTitle = { fg = p.background, bg = p.yellow, bold = true },
		TelescopePromptNormal = { fg = p.foreground, bg = p.surface1 },
		TelescopePromptBorder = { fg = p.surface2, bg = p.surface1 },
		TelescopePromptTitle = { fg = p.background, bg = p.red, bold = true },
		TelescopePromptPrefix = { fg = p.red, bg = p.surface1 },
		TelescopePromptCounter = { fg = p.third_text, bg = p.surface1 },
		TelescopePreviewNormal = { fg = p.foreground, bg = p.surface0 },
		TelescopePreviewBorder = { fg = p.surface2, bg = p.surface0 },
		TelescopePreviewTitle = { fg = p.background, bg = p.green, bold = true },
		TelescopeResultsNormal = { fg = p.foreground, bg = p.surface0 },
		TelescopeResultsBorder = { fg = p.surface2, bg = p.surface0 },
		TelescopeResultsTitle = { fg = p.surface0, bg = p.surface0 },

		-- Selection & Matching
		TelescopeSelection = { fg = p.foreground, bg = p.surface2, bold = true },
		TelescopeSelectionCaret = { fg = p.yellow, bg = p.surface2 },
		TelescopeMultiSelection = { fg = p.cyan, bg = p.surface1 },
		TelescopeMultiIcon = { fg = p.cyan },
		TelescopeMatching = { fg = p.yellow, bold = true },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
