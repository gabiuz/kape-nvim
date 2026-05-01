-- lua/kape/theme/groups/semantic.lua
-- Named intermediate groups (KapeRed, KapeErrorText, etc.) and @lsp.type.* tokens.
-- Plugin files link to these instead of referencing raw palette colors.

local colors = require("kape.colors")

---@type Kape.GroupSpec
return {
  name = "semantic",

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      -- Color aliases
      KapeFg     = { fg = scheme.base.white },
      KapeGrey   = { fg = scheme.base.dimmed3 },
      KapeRed    = { fg = scheme.base.red },
      KapeOrange = { fg = scheme.base.orange },
      KapeYellow = { fg = scheme.base.yellow },
      KapeGreen  = { fg = scheme.base.green },
      KapeAqua   = { fg = scheme.base.aqua },
      KapeBlue   = { fg = scheme.base.blue },
      KapePurple = { fg = scheme.base.purple },
      KapeCyan   = { fg = scheme.base.aqua },
      KapeViolet = { fg = scheme.base.purple },

      -- Sign column variants
      KapeRedSign    = { fg = scheme.base.red,     bg = scheme.base.dimmed5 },
      KapeOrangeSign = { fg = scheme.base.orange,  bg = scheme.base.dimmed5 },
      KapeYellowSign = { fg = scheme.base.yellow,  bg = scheme.base.dimmed5 },
      KapeGreenSign  = { fg = scheme.base.green,   bg = scheme.base.dimmed5 },
      KapeAquaSign   = { fg = scheme.base.aqua,    bg = scheme.base.dimmed5 },
      KapeBlueSign   = { fg = scheme.base.blue,    bg = scheme.base.dimmed5 },
      KapePurpleSign = { fg = scheme.base.purple,  bg = scheme.base.dimmed5 },
      KapeCyanSign   = { fg = scheme.base.aqua,    bg = scheme.base.dimmed5 },
      KapeVioletSign = { fg = scheme.base.purple,  bg = scheme.base.dimmed5 },

      -- Inline diagnostic undercurl
      KapeErrorText   = { undercurl = true, sp = scheme.inputValidation.errorBorder },
      KapeWarningText = { undercurl = true, sp = scheme.inputValidation.warningBorder },
      KapeInfoText    = { undercurl = true, sp = scheme.inputValidation.infoBorder },
      KapeHintText    = { undercurl = true, sp = scheme.inputValidation.infoBorder },

      -- Float diagnostic
      KapeErrorFloat   = { fg = scheme.inputValidation.errorForeground },
      KapeWarningFloat = { fg = scheme.inputValidation.warningForeground },
      KapeInfoFloat    = { fg = scheme.inputValidation.infoForeground },
      KapeHintFloat    = { fg = scheme.inputValidation.infoForeground },

      -- Virtual text diagnostic
      KapeVirtualTextError   = { bg = scheme.errorLens.errorBackground,   fg = scheme.errorLens.errorForeground },
      KapeVirtualTextWarning = { bg = scheme.errorLens.warningBackground, fg = scheme.errorLens.warningForeground },
      KapeVirtualTextInfo    = { bg = scheme.errorLens.infoBackground,    fg = scheme.errorLens.infoForeground },
      KapeVirtualTextHint    = { bg = scheme.errorLens.hintBackground,    fg = scheme.errorLens.hintForeground },

      -- Misc
      KapeCurrentWord = { bg = scheme.editor.wordHighlightBackground },
      KapeInlayHints  = { bg = scheme.editorInlayHint.background, fg = scheme.editorInlayHint.foreground },

      -- LSP semantic tokens
      ["@lsp.type.boolean"]              = { link = "@boolean" },
      ["@lsp.type.builtinType"]          = { link = "@type.builtin" },
      ["@lsp.type.class"]                = {},
      ["@lsp.type.comment"]              = { link = "@comment" },
      ["@lsp.type.decorator"]            = { link = "@attribute" },
      ["@lsp.type.deriveHelper"]         = { link = "@attribute" },
      ["@lsp.type.enum"]                 = { link = "@type" },
      ["@lsp.type.enumMember"]           = { link = "@constant" },
      ["@lsp.type.escapeSequence"]       = { link = "@string.escape" },
      ["@lsp.type.formatSpecifier"]      = { link = "@markup.list" },
      ["@lsp.type.generic"]              = { link = "@variable" },
      ["@lsp.type.interface"]            = { fg = colors.lighten(scheme.base.aqua, 10) },
      ["@lsp.type.keyword"]              = { link = "@keyword" },
      ["@lsp.type.lifetime"]             = { link = "@keyword.storage" },
      ["@lsp.type.namespace"]            = { link = "@module" },
      ["@lsp.type.namespace.python"]     = { link = "@variable" },
      ["@lsp.type.number"]               = { link = "@number" },
      ["@lsp.type.operator"]             = { link = "@operator" },
      ["@lsp.type.parameter"]            = {},
      ["@lsp.type.property"]             = { link = "@property" },
      ["@lsp.type.selfKeyword"]          = { link = "@variable.builtin" },
      ["@lsp.type.selfTypeKeyword"]      = { link = "@variable.builtin" },
      ["@lsp.type.string"]               = { link = "@string" },
      ["@lsp.type.type"]                 = {},
      ["@lsp.type.typeAlias"]            = { link = "@type.definition" },
      ["@lsp.type.unresolvedReference"]  = { undercurl = true, sp = scheme.base.red },
      ["@lsp.type.variable"]             = {},

      -- Type modifiers
      ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
      ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
      ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
      ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
      ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
      ["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
      ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
      ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
      ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
      ["@lsp.typemod.string.injected"]           = { link = "@string" },
      ["@lsp.typemod.struct.defaultLibrary"]     = { link = "@type.builtin" },
      ["@lsp.typemod.type.defaultLibrary"]       = { fg = colors.lighten(scheme.base.aqua, 15) },
      ["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = colors.lighten(scheme.base.aqua, 15) },
      ["@lsp.typemod.variable.callable"]         = { link = "@function" },
      ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
      ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
      ["@lsp.typemod.variable.static"]           = { link = "@constant" },
    }
  end,

  extra = function(scheme, config)
    return {
      SPNormalFloat = { bg = scheme.editorSuggestWidget.background, fg = scheme.editorSuggestWidget.foreground },
      SPFloatBorder = { bg = scheme.editor.background, fg = scheme.editorSuggestWidget.background },
      SPCursorLine  = { bg = scheme.editorLineNumber.foreground, fg = scheme.base.yellow, bold = true },
      SPTitle       = { bg = scheme.base.yellow, fg = scheme.base.black, bold = true },
    }
  end,
}
