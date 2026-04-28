local M = function(p, opts)
	local bg = opts.transparent and "NONE" or p.background
	local highlights = {

		-- Base
		BufferLineFill = { bg = bg },
		BufferLineBackground = { fg = p.third_text, bg = p.surface0 },
		BufferLineTab = { fg = p.third_text, bg = p.surface0 },
		BufferLineTabClose = { fg = p.red, bg = p.surface0 },
		BufferLineTabSelected = { fg = p.foreground, bg = p.background },
		BufferLineSeparator = { fg = p.background, bg = p.surface0 },
		BufferLineSeparatorVisible = { fg = p.background, bg = p.surface0 },
		BufferLineSeparatorSelected = { fg = p.background, bg = p.background },
		BufferLineIndicatorSelected = { fg = p.yellow, bg = p.background },
		BufferLineOffsetSeparator = { fg = p.surface2, bg = p.surface0 },

		-- Visible (open but not focused)
		BufferLineBufferVisible = { fg = p.second_text, bg = p.surface0 },
		BufferLineCloseButtonVisible = { fg = p.third_text, bg = p.surface0 },
		BufferLineNumbersVisible = { fg = p.third_text, bg = p.surface0 },
		BufferLineModifiedVisible = { fg = p.yellow, bg = p.surface0 },
		BufferLineDuplicateVisible = { fg = p.third_text, bg = p.surface0, italic = true },

		-- Selected (focused)
		BufferLineBufferSelected = { fg = p.foreground, bg = p.background, bold = true },
		BufferLineCloseButtonSelected = { fg = p.red, bg = p.background },
		BufferLineNumbersSelected = { fg = p.foreground, bg = p.background, bold = true },
		BufferLineModifiedSelected = { fg = p.yellow, bg = p.background },
		BufferLineDuplicateSelected = { fg = p.third_text, bg = p.background, italic = true },

		-- Diagnostics
		BufferLineError = { fg = p.red, bg = p.surface0 },
		BufferLineErrorVisible = { fg = p.red, bg = p.surface0 },
		BufferLineErrorSelected = { fg = p.red, bg = p.background, bold = true },
		BufferLineErrorDiagnostic = { fg = p.red, bg = p.surface0 },
		BufferLineErrorDiagnosticVisible = { fg = p.red, bg = p.surface0 },
		BufferLineErrorDiagnosticSelected = { fg = p.red, bg = p.background },
		BufferLineWarning = { fg = p.yellow, bg = p.surface0 },
		BufferLineWarningVisible = { fg = p.yellow, bg = p.surface0 },
		BufferLineWarningSelected = { fg = p.yellow, bg = p.background, bold = true },
		BufferLineWarningDiagnostic = { fg = p.yellow, bg = p.surface0 },
		BufferLineWarningDiagnosticVisible = { fg = p.yellow, bg = p.surface0 },
		BufferLineWarningDiagnosticSelected = { fg = p.yellow, bg = p.background },
		BufferLineInfo = { fg = p.blue, bg = p.surface0 },
		BufferLineInfoVisible = { fg = p.blue, bg = p.surface0 },
		BufferLineInfoSelected = { fg = p.blue, bg = p.background, bold = true },
		BufferLineInfoDiagnostic = { fg = p.blue, bg = p.surface0 },
		BufferLineInfoDiagnosticVisible = { fg = p.blue, bg = p.surface0 },
		BufferLineInfoDiagnosticSelected = { fg = p.blue, bg = p.background },
		BufferLineHint = { fg = p.cyan, bg = p.surface0 },
		BufferLineHintVisible = { fg = p.cyan, bg = p.surface0 },
		BufferLineHintSelected = { fg = p.cyan, bg = p.background, bold = true },
		BufferLineHintDiagnostic = { fg = p.cyan, bg = p.surface0 },
		BufferLineHintDiagnosticVisible = { fg = p.cyan, bg = p.surface0 },
		BufferLineHintDiagnosticSelected = { fg = p.cyan, bg = p.background },

		-- Pick
		BufferLinePick = { fg = p.red, bg = p.background, bold = true },
		BufferLinePickVisible = { fg = p.red, bg = p.surface0, bold = true },
		BufferLinePickSelected = { fg = p.red, bg = p.background, bold = true },
	}

	for group, hl_opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl_opts)
	end
end

return M
