-- lua/kape/highlights/syntax.lua
-- Classic Vim syntax highlight groups.
-- These are the fallback when Treesitter is not active.
-- Color roles:
--   violet = keywords / tags
--   orange = strings / functions / imports / jsx attrs
--   yellow = variables / numbers / constants / properties
--   cyan   = types
--   grey0  = comments  (italic)
--   fg0    = punctuation / operators

local M = function(p, opts)
	local bg     = opts.transparent_background and p.none or p.bg0
	local italic = opts.italic_comments and true or false

	-- Semantic shorthands — keeps the table below readable
	local kw  = { fg = p.violet }            -- keywords / tags
	local str = { fg = p.orange }            -- strings / functions / imports
	local var = { fg = p.yellow }            -- variables / numbers / constants
	local typ = { fg = p.cyan }              -- types
	local com = { fg = p.grey0, italic = italic } -- comments
	local pun = { fg = p.fg0 }              -- punctuation / operators

	local highlights = {

		-- Comments
		Comment        = com,
		SpecialComment = com,

		-- Keywords
		Statement   = kw,
		Conditional = kw,
		Repeat      = kw,
		Keyword     = kw,
		Exception   = kw,
		Typedef     = kw,
		Label       = str, -- "default:", "case:" labels — attr-adjacent
		Tag         = kw,  -- HTML/JSX tag names

		-- Strings & string-like
		String      = str,
		Character   = var, -- single char literal
		SpecialChar = str,

		-- Functions & imports (orange = "callable / structural")
		Function = { fg = p.orange, bold = true },
		Include  = str, -- import / require
		PreProc  = str,
		PreCondit = str,
		Define   = str,
		Macro    = str,

		-- Variables / numbers / constants
		Identifier = var,
		Number     = var,
		Float      = var,
		Boolean    = var,
		Constant   = var,

		-- Types
		Type         = typ,
		StorageClass = typ,
		Structure    = typ,

		-- Operators & punctuation
		Operator  = pun,
		Delimiter = pun,

		-- Special
		Special    = str,
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
