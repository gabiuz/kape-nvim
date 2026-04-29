-- lua/kape/highlights/syntax.lua
-- Classic vim syntax groups + Todo/Error/Underlined.

local M = function(p, opts)
	local bg     = opts.transparent_background and p.none or p.bg0
	local italic = opts.italic_comments and true or false

	local highlights = {

		-- Basics
		Comment        = { fg = p.grey0, italic = italic },
		SpecialComment = { fg = p.grey0, italic = italic },
		Delimiter      = { fg = p.fg0 },
		Ignore         = { fg = p.grey0 },
		Underlined     = { underline = true },
		Error          = { fg = p.red },
		Todo           = { fg = bg, bg = p.blue, bold = true },

		-- Literals
		String         = { fg = p.green },
		Character      = { fg = p.green },
		Number         = { fg = p.violet },
		Float          = { fg = p.violet },
		Boolean        = { fg = p.violet },

		-- Identifiers
		Identifier     = { fg = p.blue },
		Function       = { fg = p.green, bold = true },

		-- Statements & keywords
		Statement      = { fg = p.red },
		Conditional    = { fg = p.red },
		Repeat         = { fg = p.red },
		Label          = { fg = p.orange },
		Keyword        = { fg = p.red },
		Exception      = { fg = p.red },
		Typedef        = { fg = p.red },

		-- Operators
		Operator       = { fg = p.orange },

		-- Types
		Type           = { fg = p.yellow },
		StorageClass   = { fg = p.orange },
		Structure      = { fg = p.orange },

		-- Preprocessor
		PreProc        = { fg = p.violet },
		PreCondit      = { fg = p.violet },
		Include        = { fg = p.violet },
		Define         = { fg = p.violet },
		Macro          = { fg = p.cyan },

		-- Special
		Special        = { fg = p.yellow },
		SpecialChar    = { fg = p.yellow },
		Tag            = { fg = p.orange },
		Title          = { fg = p.orange, bold = true },
		Constant       = { fg = p.cyan },

		-- Diff (added for legacy syntax files)
		Added          = { link = "KapeGreen" },
		Removed        = { link = "KapeRed" },
		Changed        = { link = "KapeBlue" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
