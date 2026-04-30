-- lua/kape/highlights/syntax.lua
-- Classic Vim syntax highlight groups.
-- These are the fallback when Treesitter is not active.

local M = function(p, opts)
	local bg     = opts.transparent_background and p.none or p.bg0
	local italic = opts.italic_comments and true or false

	local highlights = {

		-- Comments
		Comment        = { fg = p.grey0, italic = italic },
		SpecialComment = { fg = p.grey0, italic = italic },

		-- Keywords
		Statement   = { fg = p.red },
		Conditional = { fg = p.violet },
		Repeat      = { fg = p.violet },
		Keyword     = { fg = p.red },
		Exception   = { fg = p.violet },
		Typedef     = { fg = p.violet },
		Label       = { fg = p.orange }, -- "default:", "case:" labels
		Tag         = { fg = p.red },    -- HTML/JSX tag names

		-- Strings & string-like
		String      = { fg = p.green },
		Character   = { fg = p.yellow }, -- single char literal
		SpecialChar = { fg = p.orange },

		-- Functions & imports
		Function  = { fg = p.orange, bold = true },
		Include   = { fg = p.orange }, -- import / require
		PreProc   = { fg = p.orange },
		PreCondit = { fg = p.orange },
		Define    = { fg = p.orange },
		Macro     = { fg = p.orange },

		-- Variables / numbers / constants
		Identifier = { fg = p.yellow },
		Number     = { fg = p.yellow },
		Float      = { fg = p.yellow },
		Boolean    = { fg = p.yellow },
		Constant   = { fg = p.yellow },

		-- Types
		Type         = { fg = p.cyan },
		StorageClass = { fg = p.cyan },
		Structure    = { fg = p.cyan },

		-- Operators & punctuation
		Operator  = { fg = p.fg0 },
		Delimiter = { fg = p.fg0 },

		-- Special
		Special    = { fg = p.orange },
		Title      = { fg = p.orange, bold = true },
		Underlined = { underline = true },
		Ignore     = { fg = p.grey0 },
		Error      = { fg = p.violet },
		Todo       = { fg = bg, bg = p.blue, bold = true },

		-- Diff
		Added   = { link = "KapeGreen" },
		Removed = { link = "KapeViolet" },
		Changed = { link = "KapeBlue" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
