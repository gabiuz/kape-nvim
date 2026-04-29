-- lua/kape/highlights/editor.lua
-- Core Neovim editor highlight groups only (no syntax, no plugins).

local M = function(p, opts)
	local bg      = opts.transparent_background and p.none or p.bg0
	local bg1     = opts.transparent_background and p.none or p.bg1
	local bg2     = opts.transparent_background and p.none or p.bg2

	local highlights = {

		-- Core
		Normal          = { fg = p.fg0,   bg = bg },
		NormalFloat     = { fg = p.fg0,   bg = bg1 },
		NormalNC        = { fg = p.fg1,   bg = bg },
		Terminal        = { fg = p.fg0,   bg = bg },

		-- Cursor
		Cursor          = { fg = bg,      bg = p.fg0 },
		CursorIM        = { link = "Cursor" },
		vCursor         = { link = "Cursor" },
		iCursor         = { link = "Cursor" },
		lCursor         = { link = "Cursor" },
		CursorLine      = { bg = bg1 },
		CursorColumn    = { bg = bg1 },
		CursorLineNr    = { fg = p.yellow, bold = true },
		TermCursor      = { link = "Cursor" },

		-- Lines & columns
		ColorColumn     = { bg = bg2 },
		LineNr          = { fg = p.bg3 },
		SignColumn      = { fg = p.fg0,   bg = bg },
		FoldColumn      = { fg = p.grey0, bg = bg },
		Folded          = { fg = p.grey1, bg = bg1 },

		-- Splits & borders
		VertSplit       = { fg = p.bg3 },
		WinSeparator    = { link = "VertSplit" },
		WinBar          = { fg = p.fg1,   bg = bg },
		WinBarNC        = { fg = p.grey0, bg = bg },

		-- Statusline & tabline
		StatusLine      = { fg = p.fg0,   bg = bg2 },
		StatusLineNC    = { fg = p.grey0, bg = bg1 },
		TabLine         = { fg = p.grey0, bg = bg1 },
		TabLineFill     = { bg = bg },
		TabLineSel      = { fg = p.fg0,   bg = bg2,  bold = true },
		ToolbarLine     = { fg = p.fg0 },
		ToolbarButton   = { fg = bg,      bg = p.grey2 },

		-- Popup menu
		Pmenu           = { fg = p.fg1,   bg = bg1 },
		PmenuSbar       = { bg = bg1 },
		PmenuSel        = { fg = bg,      bg = p.blue },
		PmenuThumb      = { bg = p.bg3 },
		WildMenu        = { link = "PmenuSel" },

		-- Floats
		FloatBorder     = { fg = p.grey1, bg = bg1 },
		FloatTitle      = { fg = p.orange, bg = bg1, bold = true },

		-- Search
		Search          = { fg = bg,      bg = p.yellow },
		IncSearch       = { fg = bg,      bg = p.bright_yellow },
		CurSearch       = { link = "IncSearch" },
		Substitute      = { fg = bg,      bg = p.yellow },

		-- Visual
		Visual          = { bg = p.bg2 },
		VisualNOS       = { bg = p.bg2 },

		-- Misc editor
		Conceal         = { fg = p.grey0 },
		Directory       = { fg = p.green },
		EndOfBuffer     = { fg = p.bg1 },
		ErrorMsg        = { fg = p.red,   bold = true, underline = true },
		WarningMsg      = { fg = p.yellow, bold = true },
		ModeMsg         = { fg = p.fg0,   bold = true },
		MoreMsg         = { fg = p.yellow, bold = true },
		MatchParen      = { bg = p.bg3 },
		NonText         = { fg = p.bg3 },
		Whitespace      = { fg = p.bg3 },
		SpecialKey      = { fg = p.orange },
		Question        = { fg = p.yellow },
		QuickFixLine    = { fg = p.violet, bold = true },

		-- Spell
		SpellBad        = { undercurl = true, sp = p.red },
		SpellCap        = { undercurl = true, sp = p.blue },
		SpellLocal      = { undercurl = true, sp = p.cyan },
		SpellRare       = { undercurl = true, sp = p.violet },

		-- Diff
		DiffAdd         = { bg = p.bg_diff_green },
		DiffChange      = { bg = p.bg_diff_blue },
		DiffDelete      = { bg = p.bg_diff_red },
		DiffText        = { fg = bg,      bg = p.blue },
		diffAdded       = { link = "DiffAdd" },
		diffRemoved     = { link = "DiffDelete" },
		diffChanged     = { link = "DiffChange" },

		-- Debugging
		Debug           = { fg = p.orange },
		debugPC         = { fg = bg,      bg = p.green },
		debugBreakpoint = { fg = bg,      bg = p.red },

		-- Health
		healthError     = { link = "KapeRed" },
		healthSuccess   = { link = "KapeGreen" },
		healthWarning   = { link = "KapeYellow" },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
