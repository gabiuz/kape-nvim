-- lua/kape/highlights/lsp.lua
-- All DiagnosticXxx groups, LspXxx links, and related diagnostic highlight groups.

local M = function(p, opts)
	local hl = vim.api.nvim_set_hl

	-- Core Diagnostic groups
	hl(0, "DiagnosticError", { fg = p.red })
	hl(0, "DiagnosticWarn",  { fg = p.yellow })
	hl(0, "DiagnosticInfo",  { fg = p.blue })
	hl(0, "DiagnosticHint",  { fg = p.cyan })
	hl(0, "DiagnosticOk",    { fg = p.green })

	-- Underline (undercurl with sp color)
	hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red })
	hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = p.yellow })
	hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = p.blue })
	hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = p.cyan })
	hl(0, "DiagnosticUnderlineOk",    { undercurl = true, sp = p.green })

	-- Virtual text → delegate to semantic groups
	hl(0, "DiagnosticVirtualTextError", { link = "KapeVirtualTextError" })
	hl(0, "DiagnosticVirtualTextWarn",  { link = "KapeVirtualTextWarning" })
	hl(0, "DiagnosticVirtualTextInfo",  { link = "KapeVirtualTextInfo" })
	hl(0, "DiagnosticVirtualTextHint",  { link = "KapeVirtualTextHint" })

	-- Floating window diagnostics
	hl(0, "DiagnosticFloatingError", { link = "KapeErrorFloat" })
	hl(0, "DiagnosticFloatingWarn",  { link = "KapeWarningFloat" })
	hl(0, "DiagnosticFloatingInfo",  { link = "KapeInfoFloat" })
	hl(0, "DiagnosticFloatingHint",  { link = "KapeHintFloat" })
	hl(0, "DiagnosticFloatingOk",    { fg = p.green })

	-- Sign column
	hl(0, "DiagnosticSignError", { link = "KapeRedSign" })
	hl(0, "DiagnosticSignWarn",  { link = "KapeYellowSign" })
	hl(0, "DiagnosticSignInfo",  { link = "KapeBlueSign" })
	hl(0, "DiagnosticSignHint",  { link = "KapeCyanSign" })
	hl(0, "DiagnosticSignOk",    { link = "KapeGreenSign" })

	-- Deprecated / unnecessary
	hl(0, "DiagnosticUnnecessary", { fg = p.grey0 })
	hl(0, "DiagnosticDeprecated",  { strikethrough = true, sp = p.fg0 })

	-- LSP legacy (v0.x) links
	local lsp_compat = {
		LspDiagnosticsFloatingError          = "DiagnosticFloatingError",
		LspDiagnosticsFloatingWarning        = "DiagnosticFloatingWarn",
		LspDiagnosticsFloatingInformation   = "DiagnosticFloatingInfo",
		LspDiagnosticsFloatingHint          = "DiagnosticFloatingHint",
		LspDiagnosticsDefaultError          = "DiagnosticError",
		LspDiagnosticsDefaultWarning        = "DiagnosticWarn",
		LspDiagnosticsDefaultInformation    = "DiagnosticInfo",
		LspDiagnosticsDefaultHint           = "DiagnosticHint",
		LspDiagnosticsVirtualTextError      = "DiagnosticVirtualTextError",
		LspDiagnosticsVirtualTextWarning    = "DiagnosticVirtualTextWarn",
		LspDiagnosticsVirtualTextInformation = "DiagnosticVirtualTextInfo",
		LspDiagnosticsVirtualTextHint       = "DiagnosticVirtualTextHint",
		LspDiagnosticsUnderlineError        = "DiagnosticUnderlineError",
		LspDiagnosticsUnderlineWarning      = "DiagnosticUnderlineWarn",
		LspDiagnosticsUnderlineInformation  = "DiagnosticUnderlineInfo",
		LspDiagnosticsUnderlineHint         = "DiagnosticUnderlineHint",
		LspDiagnosticsSignError             = "DiagnosticSignError",
		LspDiagnosticsSignWarning           = "DiagnosticSignWarn",
		LspDiagnosticsSignInformation       = "DiagnosticSignInfo",
		LspDiagnosticsSignHint              = "DiagnosticSignHint",
		LspReferenceText                    = "KapeCurrentWord",
		LspReferenceRead                    = "KapeCurrentWord",
		LspReferenceWrite                   = "KapeCurrentWord",
		LspInlayHint                        = "KapeInlayHints",
		LspCodeLens                         = "KapeVirtualTextInfo",
		LspCodeLensSeparator                = "KapeVirtualTextHint",
		LspSignatureActiveParameter         = "Search",
	}
	for group, target in pairs(lsp_compat) do
		hl(0, group, { link = target })
	end

	-- Git signs 
	hl(0, "GitSignsAdd",            { link = "KapeGreenSign" })
	hl(0, "GitSignsChange",         { link = "KapeBlueSign" })
	hl(0, "GitSignsDelete",         { link = "KapeRedSign" })
	hl(0, "GitSignsAddNr",          { link = "KapeGreen" })
	hl(0, "GitSignsChangeNr",       { link = "KapeBlue" })
	hl(0, "GitSignsDeleteNr",       { link = "KapeRed" })
	hl(0, "GitSignsAddLn",          { link = "DiffAdd" })
	hl(0, "GitSignsChangeLn",       { link = "DiffChange" })
	hl(0, "GitSignsDeleteLn",       { link = "DiffDelete" })
	hl(0, "GitSignsCurrentLineBlame", { link = "KapeGrey" })
end

return M
