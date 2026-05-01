-- lua/kape/theme/plugins/treesitter.lua
-- Modern @-capture groups (nvim-treesitter >= 0.8).
-- Deprecated @text.* / TS* aliases kept as inline links.

---@type Kape.PluginSpec
return {
  name = "nvim-treesitter/nvim-treesitter",

  highlights = function(scheme, config)
    local styles = config.styles or {}
    local italic_comment = styles.comment and styles.comment.italic
    local italic_type    = styles.type    and styles.type.italic

    -- stylua: ignore
    return {
      -- Misc
      ["@comment"]                = { fg = scheme.base.dimmed3, italic = italic_comment },
      ["@error"]                  = { fg = scheme.base.red },
      ["@none"]                   = { fg = scheme.base.white },
      ["@keyword.directive"]      = { fg = scheme.base.orange },
      ["@preproc"]                = { link = "@keyword.directive" },           -- @deprecated
      ["@keyword.directive.define"] = { fg = scheme.base.orange },
      ["@define"]                 = { link = "@keyword.directive.define" },    -- @deprecated
      ["@operator"]               = { fg = scheme.base.white },

      -- Punctuation
      ["@punctuation.delimiter"]  = { fg = scheme.base.white },
      ["@punctuation.bracket"]    = { fg = scheme.base.white },
      ["@punctuation.special"]    = { fg = scheme.base.white },

      -- Literals
      ["@string"]                 = { fg = scheme.base.green },
      ["@string.regexp"]          = { fg = scheme.base.yellow },
      ["@string.regex"]           = { link = "@string.regexp" },               -- @deprecated
      ["@string.escape"]          = { fg = scheme.base.yellow },
      ["@string.special"]         = { fg = scheme.base.yellow },
      ["@character"]              = { fg = scheme.base.green },
      ["@character.special"]      = { fg = scheme.base.yellow },
      ["@boolean"]                = { fg = scheme.base.yellow },
      ["@number"]                 = { fg = scheme.base.yellow },
      ["@number.float"]           = { fg = scheme.base.yellow },
      ["@float"]                  = { link = "@number.float" },                -- @deprecated

      -- Functions
      ["@function"]               = { fg = scheme.base.orange, bold = true },
      ["@function.builtin"]       = { fg = scheme.base.orange, bold = true },
      ["@function.call"]          = { fg = scheme.base.orange },
      ["@function.macro"]         = { fg = scheme.base.orange },
      ["@function.method"]        = { fg = scheme.base.orange, bold = true },
      ["@method"]                 = { link = "@function.method" },             -- @deprecated
      ["@function.method.call"]   = { fg = scheme.base.orange },
      ["@method.call"]            = { link = "@function.method.call" },        -- @deprecated
      ["@constructor"]            = { fg = scheme.base.orange },
      ["@variable.parameter"]     = { fg = scheme.base.yellow },
      ["@parameter"]              = { link = "@variable.parameter" },          -- @deprecated

      -- Keywords
      ["@keyword"]                = { fg = scheme.base.red },
      ["@keyword.function"]       = { fg = scheme.base.red },
      ["@keyword.operator"]       = { fg = scheme.base.white },
      ["@keyword.return"]         = { fg = scheme.base.red },
      ["@keyword.conditional"]    = { fg = scheme.base.purple },
      ["@conditional"]            = { link = "@keyword.conditional" },         -- @deprecated
      ["@keyword.repeat"]         = { fg = scheme.base.purple },
      ["@repeat"]                 = { link = "@keyword.repeat" },              -- @deprecated
      ["@keyword.debug"]          = { fg = scheme.base.purple },
      ["@debug"]                  = { link = "@keyword.debug" },               -- @deprecated
      ["@label"]                  = { fg = scheme.base.purple },
      ["@keyword.import"]         = { fg = scheme.base.purple },
      ["@include"]                = { link = "@keyword.import" },              -- @deprecated
      ["@keyword.exception"]      = { fg = scheme.base.purple },
      ["@exception"]              = { link = "@keyword.exception" },           -- @deprecated
      ["@keyword.storage"]        = { fg = scheme.base.aqua },
      ["@storageclass"]           = { link = "@keyword.storage" },             -- @deprecated

      -- Types
      ["@type"]                   = { fg = scheme.base.aqua, italic = italic_type },
      ["@type.builtin"]           = { fg = scheme.base.aqua, italic = italic_type },
      ["@type.definition"]        = { fg = scheme.base.aqua, italic = italic_type },
      ["@type.qualifier"]         = { fg = scheme.base.aqua },
      ["@attribute"]              = { fg = scheme.base.orange },
      ["@variable.member"]        = { fg = scheme.base.yellow },
      ["@field"]                  = { link = "@variable.member" },             -- @deprecated
      ["@property"]               = { fg = scheme.base.yellow },

      -- Identifiers
      ["@variable"]               = { fg = scheme.base.yellow },
      ["@variable.builtin"]       = { fg = scheme.base.yellow, italic = italic_type },
      ["@constant"]               = { fg = scheme.base.yellow },
      ["@constant.builtin"]       = { fg = scheme.base.yellow, italic = italic_type },
      ["@constant.macro"]         = { fg = scheme.base.purple, italic = italic_type },
      ["@module"]                 = { fg = scheme.base.purple, italic = italic_type },
      ["@namespace"]              = { link = "@module" },                      -- @deprecated
      ["@string.special.symbol"]  = { fg = scheme.base.yellow },
      ["@symbol"]                 = { link = "@string.special.symbol" },       -- @deprecated

      -- Markup / Text
      ["@text"]                   = { fg = scheme.base.white },                -- @deprecated
      ["@markup.strong"]          = { bold = true },
      ["@text.strong"]            = { link = "@markup.strong" },               -- @deprecated
      ["@markup.italic"]          = { italic = true },
      ["@text.emphasis"]          = { link = "@markup.italic" },               -- @deprecated
      ["@markup.underline"]       = { underline = true },
      ["@text.underline"]         = { link = "@markup.underline" },            -- @deprecated
      ["@markup.strikethrough"]   = { strikethrough = true },
      ["@text.strike"]            = { link = "@markup.strikethrough" },        -- @deprecated
      ["@markup.heading"]         = { fg = scheme.base.orange, bold = true },
      ["@markup.heading.1.markdown"] = { fg = scheme.base.red,    bold = true },
      ["@markup.heading.2.markdown"] = { fg = scheme.base.orange, bold = true },
      ["@markup.heading.3.markdown"] = { fg = scheme.base.yellow,  bold = true },
      ["@markup.heading.4.markdown"] = { fg = scheme.base.green,   bold = true },
      ["@markup.heading.5.markdown"] = { fg = scheme.base.aqua,    bold = true },
      ["@markup.heading.6.markdown"] = { fg = scheme.base.blue,    bold = true },
      ["@text.title"]             = { link = "@markup.heading" },              -- @deprecated
      ["@markup.raw"]             = { fg = scheme.base.green },
      ["@text.literal"]           = { link = "@markup.raw" },                  -- @deprecated
      ["@markup.link.url"]        = { fg = scheme.base.blue, underline = true, sp = scheme.base.blue },
      ["@text.uri"]               = { link = "@markup.link.url" },             -- @deprecated
      ["@markup.link.label"]      = { fg = scheme.base.aqua },
      ["@markup.link"]            = { fg = scheme.base.aqua },
      ["@text.reference"]         = { link = "@markup.link" },                 -- @deprecated
      ["@markup.math"]            = { fg = scheme.base.yellow },
      ["@text.math"]              = { link = "@markup.math" },                 -- @deprecated
      ["@markup.environment"]     = { fg = scheme.base.purple },
      ["@text.environment"]       = { link = "@markup.environment" },          -- @deprecated
      ["@markup.environment.name"] = { fg = scheme.base.orange },
      ["@text.environment.name"]  = { link = "@markup.environment.name" },     -- @deprecated
      ["@markup.list"]            = { fg = scheme.base.white },
      ["@markup.list.unchecked"]  = { fg = scheme.base.dimmed3 },
      ["@markup.list.checked"]    = { fg = scheme.base.green },
      ["@markup.quote"]           = { fg = scheme.base.dimmed3, italic = true },
      ["@markup.note"]            = { fg = scheme.editor.background, bg = scheme.base.green, bold = true },

      -- Comment annotations
      ["@comment.todo"]    = { fg = scheme.editor.background, bg = scheme.base.blue,    bold = true },
      ["@text.todo"]       = { link = "@comment.todo" },                       -- @deprecated
      ["@comment.note"]    = { fg = scheme.editor.background, bg = scheme.base.green,   bold = true },
      ["@text.note"]       = { link = "@comment.note" },                       -- @deprecated
      ["@comment.warning"] = { fg = scheme.editor.background, bg = scheme.base.yellow,  bold = true },
      ["@text.warning"]    = { link = "@comment.warning" },                    -- @deprecated
      ["@comment.error"]   = { fg = scheme.editor.background, bg = scheme.base.red,     bold = true },
      ["@text.danger"]     = { link = "@comment.error" },                      -- @deprecated

      -- Diff
      ["@diff.plus"]       = { link = "DiffAdd" },
      ["@text.diff.add"]   = { link = "DiffAdd" },                             -- @deprecated
      ["@diff.minus"]      = { link = "DiffDelete" },
      ["@text.diff.delete"] = { link = "DiffDelete" },                         -- @deprecated
      ["@diff.delta"]      = { link = "DiffChange" },

      -- Tags (HTML / JSX / XML)
      ["@tag"]             = { fg = scheme.base.red },
      ["@tag.attribute"]   = { fg = scheme.base.orange },
      ["@tag.delimiter"]   = { fg = scheme.base.white },

      -- Conceal
      ["@conceal"]         = { fg = scheme.base.dimmed3 },

      -- Language-specific
      ["@constant.git_rebase"] = { fg = scheme.base.aqua },
      ["@property.yaml"]       = { fg = scheme.base.aqua },
      ["@character.printf"]    = { fg = scheme.base.yellow },
    }
  end,
}
