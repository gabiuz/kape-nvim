local M = function(p)
	local highlights = {

		-- Normal mode
		LualineNormalA = { fg = p.background, bg = p.yellow, bold = true },
		LualineNormalB = { fg = p.foreground, bg = p.surface1 },
		LualineNormalC = { fg = p.second_text, bg = p.surface0 },

		-- Insert mode
		LualineInsertA = { fg = p.background, bg = p.green, bold = true },
		LualineInsertB = { fg = p.foreground, bg = p.surface1 },
		LualineInsertC = { fg = p.second_text, bg = p.surface0 },

		-- Visual mode
		LualineVisualA = { fg = p.background, bg = p.violet, bold = true },
		LualineVisualB = { fg = p.foreground, bg = p.surface1 },
		LualineVisualC = { fg = p.second_text, bg = p.surface0 },

		-- Replace mode
		LualineReplaceA = { fg = p.background, bg = p.red, bold = true },
		LualineReplaceB = { fg = p.foreground, bg = p.surface1 },
		LualineReplaceC = { fg = p.second_text, bg = p.surface0 },

		-- Command mode
		LualineCommandA = { fg = p.background, bg = p.cyan, bold = true },
		LualineCommandB = { fg = p.foreground, bg = p.surface1 },
		LualineCommandC = { fg = p.second_text, bg = p.surface0 },

		-- Inactive windows
		LualineInactiveA = { fg = p.third_text, bg = p.surface0 },
		LualineInactiveB = { fg = p.third_text, bg = p.surface0 },
		LualineInactiveC = { fg = p.third_text, bg = p.background },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
