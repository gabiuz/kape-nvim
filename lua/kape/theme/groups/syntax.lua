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
      Constant  = { fg = scheme.base.purple },
      String    = { fg = scheme.base.green },
      Character = { fg = scheme.base.purple },
      Number    = { fg = scheme.base.purple },
      Float     = { fg = scheme.base.purple },
      Boolean   = { fg = scheme.base.purple },

      -- Identifiers
      Identifier = { fg = scheme.base.aqua },
      Function   = { fg = scheme.base.orange },

      -- Statements
      Statement   = { fg = scheme.base.red },
      Conditional = { fg = scheme.base.red },
      Repeat      = { fg = scheme.base.red },
      Label       = { fg = scheme.base.red },
      Operator    = { fg = scheme.base.green },
      Keyword     = { fg = scheme.base.red,     italic = styles.keyword   and styles.keyword.italic },
      Exception   = { fg = scheme.base.red },

      -- Preprocessor
      PreProc   = { fg = scheme.base.orange },
      Include   = { fg = scheme.base.orange },
      Define    = { fg = scheme.base.orange },
      Macro     = { fg = scheme.base.orange },
      PreCondit = { fg = scheme.base.orange },

      -- Types
      Type         = { fg = scheme.base.red,     italic = styles.type and styles.type.italic },
      StorageClass = { fg = scheme.base.orange,  italic = styles.type and styles.type.italic },
      Structure    = { fg = scheme.base.red,     italic = styles.type and styles.type.italic },
      Typedef      = { fg = scheme.base.red },

      -- Special
      Special      = { fg = scheme.base.orange },
      SpecialChar  = { fg = scheme.base.orange },
      Delimiter    = { fg = scheme.base.green },

      -- Text styles
      Underlined = { underline = true },
      Bold       = { bold = true },
      Italic     = { italic = true },
      Ignore     = { fg = scheme.base.dimmed3 },

      -- Errors & todos
      Error = { fg = scheme.inputValidation.errorForeground },
      Todo  = { bg = scheme.editor.background, fg = scheme.base.blue, bold = true },
      Tag   = { fg = scheme.base.orange },

      -- Title
      Title = { fg = scheme.base.yellow, bold = true },
    }
  end,
}
