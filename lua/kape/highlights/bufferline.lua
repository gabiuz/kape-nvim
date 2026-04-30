-- lua/kape/highlights/bufferline.lua

local M = function(p, opts)
	local bg = opts.transparent_background and p.none or p.bg0

	-- Three-state palette
	-- active   = selected / focused buffer     → bg0 (editor surface)
	-- visible  = open but unfocused window     → bg1
	-- fill     = inactive / background tabs    → bg1
	local active_bg   = bg
	local active_fg   = p.fg0
	local visible_bg  = p.bg1
	local visible_fg  = p.fg1
	local fill_bg     = p.bg1
	local fill_fg     = p.grey0
	local tabs_bg     = bg     -- the bar area between tabs

	local highlights = {
		-- Fill / offset
		BufferLineFill            = { bg = tabs_bg },
		BufferLineOffsetSeparator = { link = "NeoTreeWinSeparator" },

		-- Buffer states
		BufferLineBufferSelected  = { bg = active_bg,  fg = active_fg,  bold = true },
		BufferLineBackground      = { bg = fill_bg,    fg = fill_fg },
		BufferLineBufferVisible   = { bg = visible_bg, fg = visible_fg },

		-- Duplicate
		BufferLineDuplicateSelected = { bg = active_bg,  fg = p.grey0, italic = true },
		BufferLineDuplicate         = { bg = fill_bg,    fg = p.bg3,   italic = true },
		BufferLineDuplicateVisible  = { bg = visible_bg, fg = p.grey0, italic = true },

		-- Close button
		BufferLineCloseButtonSelected = { bg = active_bg,  fg = active_fg },
		BufferLineCloseButton         = { bg = fill_bg,    fg = fill_fg },
		BufferLineCloseButtonVisible  = { bg = visible_bg, fg = visible_fg },

		-- Separator
		BufferLineSeparatorSelected = { bg = active_bg,  fg = tabs_bg },
		BufferLineSeparator         = { bg = fill_bg,    fg = tabs_bg },
		BufferLineSeparatorVisible  = { bg = visible_bg, fg = tabs_bg },

		-- Numbers
		BufferLineNumbersSelected = { bg = active_bg,  fg = active_fg,  bold = true },
		BufferLineNumbers         = { bg = fill_bg,    fg = fill_fg },
		BufferLineNumbersVisible  = { bg = visible_bg, fg = visible_fg },

		-- Modified indicator
		BufferLineModifiedSelected = { bg = active_bg,  fg = p.yellow },
		BufferLineModified         = { bg = fill_bg,    fg = p.yellow },
		BufferLineModifiedVisible  = { bg = visible_bg, fg = p.yellow },

		-- Warning
		BufferLineWarningSelected = { bg = active_bg,  fg = p.yellow, bold = true },
		BufferLineWarning         = { bg = fill_bg,    fg = p.yellow },
		BufferLineWarningVisible  = { bg = visible_bg, fg = p.yellow },

		-- Warning diagnostic (count badge)
		BufferLineWarningDiagnosticSelected = { bg = active_bg,  fg = p.yellow },
		BufferLineWarningDiagnostic         = { bg = fill_bg,    fg = p.grey0 },
		BufferLineWarningDiagnosticVisible  = { bg = visible_bg, fg = p.yellow },

		-- Error
		BufferLineErrorSelected = { bg = active_bg,  fg = p.red, bold = true },
		BufferLineError         = { bg = fill_bg,    fg = p.red },
		BufferLineErrorVisible  = { bg = visible_bg, fg = p.red },

		-- Error diagnostic (count badge)
		BufferLineErrorDiagnosticSelected = { bg = active_bg,  fg = p.red, bold = true },
		BufferLineErrorDiagnostic         = { bg = fill_bg,    fg = p.grey0 },
		BufferLineErrorDiagnosticVisible  = { bg = visible_bg, fg = p.red },

		-- Info
		BufferLineInfoSelected = { bg = active_bg,  fg = p.blue, bold = true },
		BufferLineInfo         = { bg = fill_bg,    fg = p.blue },
		BufferLineInfoVisible  = { bg = visible_bg, fg = p.blue },

		-- Info diagnostic (count badge)
		BufferLineInfoDiagnosticSelected = { bg = active_bg,  fg = p.blue, bold = true },
		BufferLineInfoDiagnostic         = { bg = fill_bg,    fg = p.grey0 },
		BufferLineInfoDiagnosticVisible  = { bg = visible_bg, fg = p.blue },

		-- Hint (link to info)
		BufferLineHintSelected            = { link = "BufferLineInfoSelected" },
		BufferLineHint                    = { link = "BufferLineInfo" },
		BufferLineHintVisible             = { link = "BufferLineInfoVisible" },
		BufferLineHintDiagnosticSelected  = { link = "BufferLineInfoDiagnosticSelected" },
		BufferLineHintDiagnostic          = { link = "BufferLineInfoDiagnostic" },
		BufferLineHintDiagnosticVisible   = { link = "BufferLineInfoDiagnosticVisible" },

		-- Pick
		BufferLinePickSelected = { bg = active_bg,  fg = p.red, bold = true },
		BufferLinePick         = { bg = fill_bg,    fg = p.red, bold = true },
		BufferLinePickVisible  = { bg = visible_bg, fg = p.red, bold = true },

		-- Tab
		BufferLineTabSelected       = { bg = active_bg,  fg = active_fg,  bold = true },
		BufferLineTab               = { bg = fill_bg,    fg = fill_fg },
		BufferLineTabClose          = { bg = tabs_bg,    fg = tabs_bg },
		BufferLineTabSeparatorSelected = { bg = active_bg, fg = active_bg },
		BufferLineTabSeparator         = { bg = fill_bg,   fg = fill_bg },

		-- Indicator
		BufferLineIndicatorSelected = { bg = active_bg,  fg = p.yellow },
		BufferLineIndicator         = { bg = fill_bg,    fg = fill_bg },
		BufferLineIndicatorVisible  = { bg = visible_bg, fg = visible_bg },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
