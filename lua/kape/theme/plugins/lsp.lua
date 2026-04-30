-- lua/kape/theme/plugins/lsp.lua
-- DiagnosticXxx groups, LspXxx links, and undercurl diagnostic styles.

---@type Kape.PluginSpec
return {
  name = "lsp",

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      -- Core diagnostic severity
      DiagnosticError = { fg = scheme.inputValidation.errorForeground },
      DiagnosticWarn  = { fg = scheme.inputValidation.warningForeground },
      DiagnosticInfo  = { fg = scheme.inputValidation.infoForeground },
      DiagnosticHint  = { fg = scheme.inputValidation.infoForeground },
      DiagnosticOk    = { fg = scheme.base.green },

      -- Sign column
      DiagnosticSignError = { fg = scheme.inputValidation.errorForeground },
      DiagnosticSignWarn  = { fg = scheme.inputValidation.warningForeground },
      DiagnosticSignInfo  = { fg = scheme.inputValidation.infoForeground },
      DiagnosticSignHint  = { fg = scheme.inputValidation.infoForeground },

      -- Virtual text (delegates to Kape semantic groups, which respect config.diagnostic_virtual_text)
      DiagnosticVirtualTextError = { link = "KapeVirtualTextError" },
      DiagnosticVirtualTextWarn  = { link = "KapeVirtualTextWarning" },
      DiagnosticVirtualTextInfo  = { link = "KapeVirtualTextInfo" },
      DiagnosticVirtualTextHint  = { link = "KapeVirtualTextHint" },

      -- Underlines (undercurl)
      DiagnosticUnderlineError = { sp = scheme.inputValidation.errorBorder,   undercurl = true },
      DiagnosticUnderlineWarn  = { sp = scheme.inputValidation.warningBorder,  undercurl = true },
      DiagnosticUnderlineInfo  = { sp = scheme.inputValidation.infoBorder,    undercurl = true },
      DiagnosticUnderlineHint  = { sp = scheme.inputValidation.infoBorder,    undercurl = true },
      DiagnosticUnderlineOk    = { sp = scheme.base.green,                    undercurl = true },
      DiagnosticUnnecessary    = { fg = scheme.base.dimmed3 },
      DiagnosticDeprecated     = { strikethrough = true, sp = scheme.base.white },

      -- Floating diagnostics
      DiagnosticFloatingError = { link = "KapeErrorFloat" },
      DiagnosticFloatingWarn  = { link = "KapeWarningFloat" },
      DiagnosticFloatingInfo  = { link = "KapeInfoFloat" },
      DiagnosticFloatingHint  = { link = "KapeHintFloat" },
      DiagnosticFloatingOk    = { fg = scheme.base.green },

      -- LSP references
      LspReferenceRead  = { bg = scheme.editor.wordHighlightBackground },
      LspReferenceText  = { bg = scheme.editor.selectionHighlightBackground },
      LspReferenceWrite = { bg = scheme.editor.wordHighlightStrongBackground },

      -- Inlay hints
      LspInlayHint         = { link = "KapeInlayHints" },
      LspCodeLens          = { link = "KapeVirtualTextInfo" },
      LspCodeLensSeparator = { link = "KapeVirtualTextHint" },
      LspSignatureActiveParameter = { link = "Search" },

      -- LSP legacy (v0.x) compat links
      LspDiagnosticsFloatingError          = { link = "DiagnosticFloatingError" },
      LspDiagnosticsFloatingWarning        = { link = "DiagnosticFloatingWarn" },
      LspDiagnosticsFloatingInformation    = { link = "DiagnosticFloatingInfo" },
      LspDiagnosticsFloatingHint           = { link = "DiagnosticFloatingHint" },
      LspDiagnosticsDefaultError           = { link = "DiagnosticError" },
      LspDiagnosticsDefaultWarning         = { link = "DiagnosticWarn" },
      LspDiagnosticsDefaultInformation     = { link = "DiagnosticInfo" },
      LspDiagnosticsDefaultHint            = { link = "DiagnosticHint" },
      LspDiagnosticsVirtualTextError       = { link = "DiagnosticVirtualTextError" },
      LspDiagnosticsVirtualTextWarning     = { link = "DiagnosticVirtualTextWarn" },
      LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
      LspDiagnosticsVirtualTextHint        = { link = "DiagnosticVirtualTextHint" },
      LspDiagnosticsUnderlineError         = { link = "DiagnosticUnderlineError" },
      LspDiagnosticsUnderlineWarning       = { link = "DiagnosticUnderlineWarn" },
      LspDiagnosticsUnderlineInformation   = { link = "DiagnosticUnderlineInfo" },
      LspDiagnosticsUnderlineHint          = { link = "DiagnosticUnderlineHint" },
      LspDiagnosticsSignError              = { link = "DiagnosticSignError" },
      LspDiagnosticsSignWarning            = { link = "DiagnosticSignWarn" },
      LspDiagnosticsSignInformation        = { link = "DiagnosticSignInfo" },
      LspDiagnosticsSignHint               = { link = "DiagnosticSignHint" },
    }
  end,
}
