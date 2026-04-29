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
		Error          = { fg = p.violet },
		Todo           = { fg = bg, bg = p.blue, bold = true },

		-- Literals
		String         = { fg = p.green },
		Character      = { fg = p.green },
		Number         = { fg = p.yellow },
		Float          = { fg = p.yellow },
		Boolean        = { fg = p.yellow },

		-- Identifiers
		Identifier     = { fg = p.yellow },
		Function       = { fg = p.green, bold = true },

		-- Statements & keywords
		Statement      = { fg = p.violet },
		Conditional    = { fg = p.violet },
		Repeat         = { fg = p.violet },
		Label          = { fg = p.orange },
		Keyword        = { fg = p.violet },
		Exception      = { fg = p.violet },
		Typedef        = { fg = p.violet },

		-- Operators
		Operator       = { fg = p.fg0 },

		-- Types
		Type           = { fg = p.cyan },
		StorageClass   = { fg = p.cyan },
		Structure      = { fg = p.cyan },

		-- Preprocessor
		PreProc        = { fg = p.orange },
		PreCondit      = { fg = p.orange },
		Include        = { fg = p.orange },
		Define         = { fg = p.orange },
		Macro          = { fg = p.orange },

		-- Special
		Special        = { fg = p.orange },
		SpecialChar    = { fg = p.orange },
		Tag            = { fg = p.violet },
		Title          = { fg = p.orange, bold = true },
		Constant       = { fg = p.yellow },

		-- Diff (added for legacy syntax files)
		Added          = { link = "KapeGreen" },
		Removed        = { link = "Kapeviolet" },
		Changed        = { link = "KapeBlue" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
