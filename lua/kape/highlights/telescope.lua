-- lua/kape/highlights/telescope.lua

local M = function(p, opts)
	local bg         = opts.transparent_background and p.none or p.bg0
	local prompt_bg  = opts.transparent_background and p.none or p.bg2
	local panel_bg   = opts.transparent_background and p.none or p.bg1

	local highlights = {
		-- Selection
		TelescopeSelection      = { bg = p.bg_visual_green, bold = true },
		TelescopeSelectionCaret = { bg = p.bg_visual_green, fg = p.green },
		TelescopeMultiSelection = { bg = p.bg_visual_blue,  fg = p.cyan },
		TelescopeMultiIcon      = { fg = p.cyan },

		-- Global
		TelescopeNormal         = { bg = panel_bg, fg = p.fg0 },
		TelescopeBorder         = { bg = bg,        fg = bg },
		TelescopeMatching       = { fg = p.blue,    bold = true },
		TelescopePreviewLine    = { link = "TelescopeSelection" },

		-- Prompt
		TelescopePromptTitle    = { bg = p.yellow,  fg = p.bg0, bold = true },
		TelescopePromptNormal   = { bg = prompt_bg, fg = p.fg0 },
		TelescopePromptBorder   = { bg = bg,        fg = prompt_bg },
		TelescopePromptPrefix   = { fg = p.cyan },
		TelescopePromptCounter  = { fg = p.red,     bold = true },

		-- Preview
		TelescopePreviewTitle   = { bg = p.yellow,  fg = p.bg0, bold = true },
		TelescopePreviewNormal  = { bg = panel_bg,  fg = p.fg0 },
		TelescopePreviewBorder  = { bg = bg,        fg = panel_bg },

		-- Results
		TelescopeResultsTitle   = { bg = p.yellow,  fg = p.bg0, bold = true },
		TelescopeResultsNormal  = { bg = panel_bg,  fg = p.fg0 },
		TelescopeResultsBorder  = { bg = bg,        fg = panel_bg },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
