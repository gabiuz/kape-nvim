-- lua/kape/highlights/bufferline.lua
-- Uses semantic group links where possible.

local M = function(p, opts)
	local bg = opts.transparent_background and p.none or p.bg0

	local highlights = {

		-- Base
		BufferLineFill              = { bg = bg },
		BufferLineBackground        = { fg = p.grey0, bg = p.bg1 },
		BufferLineTab               = { fg = p.grey0, bg = p.bg1 },
		BufferLineTabClose          = { link = "KapeRed" },
		BufferLineTabSelected       = { fg = p.fg0,   bg = bg },
		BufferLineSeparator         = { fg = bg,      bg = p.bg1 },
		BufferLineSeparatorVisible  = { fg = bg,      bg = p.bg1 },
		BufferLineSeparatorSelected = { fg = bg,      bg = bg },
		BufferLineIndicatorSelected = { fg = p.yellow, bg = bg },
		BufferLineOffsetSeparator   = { fg = p.bg3,   bg = p.bg1 },

		-- Visible (open but not focused)
		BufferLineBufferVisible     = { fg = p.fg1,   bg = p.bg1 },
		BufferLineCloseButtonVisible = { fg = p.grey0, bg = p.bg1 },
		BufferLineNumbersVisible    = { fg = p.grey0, bg = p.bg1 },
		BufferLineModifiedVisible   = { link = "KapeYellow" },
		BufferLineDuplicateVisible  = { fg = p.grey0, bg = p.bg1, italic = true },

		-- Selected (focused)
		BufferLineBufferSelected    = { fg = p.fg0,   bg = bg, bold = true },
		BufferLineCloseButtonSelected = { fg = p.red, bg = bg },
		BufferLineNumbersSelected   = { fg = p.fg0,   bg = bg, bold = true },
		BufferLineModifiedSelected  = { link = "KapeYellow" },
		BufferLineDuplicateSelected = { fg = p.grey0, bg = bg,    italic = true },

		-- Diagnostics — unselected
		BufferLineError                        = { link = "KapeRed" },
		BufferLineErrorVisible                 = { link = "KapeRed" },
		BufferLineErrorDiagnostic              = { link = "KapeRed" },
		BufferLineErrorDiagnosticVisible       = { link = "KapeRed" },
		BufferLineWarning                      = { link = "KapeYellow" },
		BufferLineWarningVisible               = { link = "KapeYellow" },
		BufferLineWarningDiagnostic            = { link = "KapeYellow" },
		BufferLineWarningDiagnosticVisible     = { link = "KapeYellow" },
		BufferLineInfo                         = { link = "KapeBlue" },
		BufferLineInfoVisible                  = { link = "KapeBlue" },
		BufferLineInfoDiagnostic               = { link = "KapeBlue" },
		BufferLineInfoDiagnosticVisible        = { link = "KapeBlue" },
		BufferLineHint                         = { link = "KapeCyan" },
		BufferLineHintVisible                  = { link = "KapeCyan" },
		BufferLineHintDiagnostic               = { link = "KapeCyan" },
		BufferLineHintDiagnosticVisible        = { link = "KapeCyan" },

		-- Diagnostics — selected
		BufferLineErrorSelected                = { fg = p.red,    bg = bg, bold = true },
		BufferLineErrorDiagnosticSelected      = { fg = p.red,    bg = bg },
		BufferLineWarningSelected              = { fg = p.yellow, bg = bg, bold = true },
		BufferLineWarningDiagnosticSelected    = { fg = p.yellow, bg = bg },
		BufferLineInfoSelected                 = { fg = p.blue,   bg = bg, bold = true },
		BufferLineInfoDiagnosticSelected       = { fg = p.blue,   bg = bg },
		BufferLineHintSelected                 = { fg = p.cyan,   bg = bg, bold = true },
		BufferLineHintDiagnosticSelected       = { fg = p.cyan,   bg = bg },

		-- Pick
		BufferLinePick         = { fg = p.red, bg = bg,      bold = true },
		BufferLinePickVisible  = { fg = p.red, bg = p.bg1,   bold = true },
		BufferLinePickSelected = { fg = p.red, bg = bg,      bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
