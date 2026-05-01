-- lua/kape/theme/groups/syntax.lua
-- Classic Vim syntax highlight groups (fallback when treesitter is not active).

---@type Kape.GroupSpec
return {
  name = "syntax",

  highlights = function(scheme, config)
    local styles = config.styles or {}

    return {
      -- Comments
      Comment        = { fg = scheme.base.dimmed3, italic = styles.comment and styles.comment.italic },
      SpecialComment = { fg = scheme.base.dimmed3, italic = styles.comment and styles.comment.italic },

      -- Constants
      Constant  = { fg = scheme.base.yellow },
      String    = { fg = scheme.base.green },
      Character = { fg = scheme.base.yellow },
      Number    = { fg = scheme.base.yellow },
      Float     = { fg = scheme.base.yellow },
      Boolean   = { fg = scheme.base.yellow },

      -- Identifiers
      Identifier = { fg = scheme.base.yellow },
      Function   = { fg = scheme.base.orange, bold = true },

      -- Statements
      Statement   = { fg = scheme.base.red },
      Conditional = { fg = scheme.base.purple },
      Repeat      = { fg = scheme.base.purple },
      Label       = { fg = scheme.base.purple },
      Operator    = { fg = scheme.base.white },
      Keyword     = { fg = scheme.base.red,     italic = styles.keyword   and styles.keyword.italic },
      Exception   = { fg = scheme.base.purple },

      -- Preprocessor
      PreProc   = { fg = scheme.base.orange },
      Include   = { fg = scheme.base.orange },
      Define    = { fg = scheme.base.orange },
      Macro     = { fg = scheme.base.orange },
      PreCondit = { fg = scheme.base.orange },

      -- Types
      Type         = { fg = scheme.base.aqua,  italic = styles.type and styles.type.italic },
      StorageClass = { fg = scheme.base.aqua,  italic = styles.type and styles.type.italic },
      Structure    = { fg = scheme.base.aqua,  italic = styles.type and styles.type.italic },
      Typedef      = { fg = scheme.base.purple },

      -- Special
      Special      = { fg = scheme.base.orange },
      SpecialChar  = { fg = scheme.base.orange },
      Delimiter    = { fg = scheme.base.white },

      -- Text styles
      Underlined = { underline = true },
      Bold       = { bold = true },
      Italic     = { italic = true },
      Ignore     = { fg = scheme.base.dimmed3 },

      -- Errors & todos
      Error = { fg = scheme.inputValidation.errorForeground },
      Todo  = { bg = scheme.editor.background, fg = scheme.base.purple, bold = true },
      Tag   = { fg = scheme.base.red },

      -- Title
      Title = { fg = scheme.base.yellow, bold = true },
    }
  end,
}
