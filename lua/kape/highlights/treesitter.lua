-- lua/kape/highlights/treesitter.lua
-- Modern @-capture groups (nvim-treesitter >= 0.8) + LSP semantic tokens.
-- Deprecated @text.* / TS* aliases kept as inline links.
local M = function(p, opts)
    local italic = opts.italic_comments and true or false

    local highlights = {

        -- Misc
        ["@comment"] = {
            fg = p.grey0,
            italic = italic
        }, --  line and block comments
        ["@error"] = {
            fg = p.red
        }, --  syntax/parser errors
        ["@none"] = {
            fg = p.fg0
        }, --  disabled highlight (identity)
        ["@keyword.directive"] = {
            fg = p.orange
        }, --  preprocessor directives & shebangs
        ["@preproc"] = {
            link = "@keyword.directive"
        }, -- @deprecated
        ["@keyword.directive.define"] = {
            fg = p.orange
        }, --  preprocessor #define
        ["@define"] = {
            link = "@keyword.directive.define"
        }, -- @deprecated
        ["@operator"] = {
            fg = p.fg0
        }, --  symbolic operators (+ * ...)

        -- Punctuation
        ["@punctuation.delimiter"] = {
            fg = p.fg0
        }, --  delimiters (; . ,)
        ["@punctuation.bracket"] = {
            fg = p.fg0
        }, --  brackets ( ) { } [ ]
        ["@punctuation.special"] = {
            fg = p.fg0
        }, --  special punctuation (string interpolation)

        -- Literals
        ["@string"] = {
            fg = p.green
        }, --  string literals
        ["@string.regexp"] = {
            fg = p.yellow
        }, --  regular expressions
        ["@string.regex"] = {
            link = "@string.regexp"
        }, -- @deprecated
        ["@string.escape"] = {
            fg = p.yellow
        }, --  escape sequences
        ["@string.special"] = {
            fg = p.yellow
        }, --  other special strings (dates, etc.)
        ["@character"] = {
            fg = p.green
        }, --  character literals
        ["@character.special"] = {
            fg = p.yellow
        }, --  special characters (wildcards)
        ["@boolean"] = {
            fg = p.yellow
        }, --  boolean literals
        ["@number"] = {
            fg = p.yellow
        }, --  numeric literals
        ["@number.float"] = {
            fg = p.yellow
        }, --  floating-point literals
        ["@float"] = {
            link = "@number.float"
        }, -- @deprecated

        -- Functions
        ["@function"] = {
            fg = p.orange,
            bold = true
        }, --  function definitions
        ["@function.builtin"] = {
            fg = p.orange,
            bold = true
        }, --  built-in functions
        ["@function.call"] = {
            fg = p.orange
        }, --  function calls
        ["@function.macro"] = {
            fg = p.orange
        }, --  preprocessor macros
        ["@function.method"] = {
            fg = p.orange,
            bold = true
        }, --  method definitions
        ["@method"] = {
            link = "@function.method"
        }, -- @deprecated
        ["@function.method.call"] = {
            fg = p.orange
        }, --  method calls
        ["@method.call"] = {
            link = "@function.method.call"
        }, -- @deprecated
        ["@constructor"] = {
            fg = p.orange
        }, --  constructor calls and definitions
        ["@variable.parameter"] = {
            fg = p.yellow
        }, --  function parameters
        ["@parameter"] = {
            link = "@variable.parameter"
        }, -- @deprecated

        -- Keywords
        ["@keyword"] = {
            fg = p.red
        }, --  generic keywords
        ["@keyword.function"] = {
            fg = p.red
        }, --  `function`, `def`, `func`, …
        ["@keyword.operator"] = {
            fg = p.fg0
        }, --  word operators (`and`, `or`, `not`)
        ["@keyword.return"] = {
            fg = p.red
        }, --  `return`, `yield`
        ["@keyword.conditional"] = {
            fg = p.violet
        }, --  `if`, `else`, `switch`
        ["@conditional"] = {
            link = "@keyword.conditional"
        }, -- @deprecated
        ["@keyword.repeat"] = {
            fg = p.violet
        }, --  `for`, `while`, `loop`
        ["@repeat"] = {
            link = "@keyword.repeat"
        }, -- @deprecated
        ["@keyword.debug"] = {
            fg = p.orange
        }, --  debug keywords
        ["@debug"] = {
            link = "@keyword.debug"
        }, -- @deprecated
        ["@label"] = {
            fg = p.orange
        }, --  GOTO labels, `case:` labels
        ["@keyword.import"] = {
            fg = p.violet
        }, --  `import`, `require`, `use`
        ["@include"] = {
            link = "@keyword.import"
        }, -- @deprecated
        ["@keyword.exception"] = {
            fg = p.violet
        }, --  `throw`, `catch`, `try`
        ["@exception"] = {
            link = "@keyword.exception"
        }, -- @deprecated
        ["@keyword.storage"] = {
            fg = p.cyan
        }, --  storage / lifetime modifiers
        ["@storageclass"] = {
            link = "@keyword.storage"
        }, -- @deprecated

        -- Types
        ["@type"] = {
            fg = p.cyan,
            italic = italic
        }, --  type and class definitions
        ["@type.builtin"] = {
            fg = p.cyan,
            italic = italic
        }, --  built-in types (`int`, `string`)
        ["@type.definition"] = {
            fg = p.cyan,
            italic = italic
        }, --  typedef / type alias
        ["@type.qualifier"] = {
            fg = p.cyan
        }, --  `const`, `mut`, `readonly`
        ["@attribute"] = {
            fg = p.orange
        }, --  annotations / decorators
        ["@variable.member"] = {
            fg = p.yellow
        }, --  struct / object fields
        ["@field"] = {
            link = "@variable.member"
        }, -- @deprecated
        ["@property"] = {
            fg = p.yellow
        }, --  property access

        -- Identifiers
        ["@variable"] = {
            fg = p.yellow
        }, --  variable names
        ["@variable.builtin"] = {
            fg = p.yellow,
            italic = italic
        }, --  `self`, `this`, `super`
        ["@constant"] = {
            fg = p.yellow
        }, --  constant identifiers
        ["@constant.builtin"] = {
            fg = p.yellow,
            italic = italic
        }, --  built-in constants (`nil`, `true`)
        ["@constant.macro"] = {
            fg = p.violet,
            italic = italic
        }, --  preprocessor-defined constants
        ["@module"] = {
            fg = p.violet,
            italic = italic
        }, --  modules / namespaces
        ["@namespace"] = {
            link = "@module"
        }, -- @deprecated
        ["@string.special.symbol"] = {
            fg = p.yellow
        }, --  symbols / atoms
        ["@symbol"] = {
            link = "@string.special.symbol"
        }, -- @deprecated

        -- Markup / Text
        ["@text"] = {
            fg = p.fg0
        }, -- @deprecated (prose text)
        ["@markup.strong"] = {
            bold = true
        }, --  bold
        ["@text.strong"] = {
            link = "@markup.strong"
        }, -- @deprecated
        ["@markup.italic"] = {
            italic = true
        }, --  italic / emphasis
        ["@text.emphasis"] = {
            link = "@markup.italic"
        }, -- @deprecated
        ["@markup.underline"] = {
            underline = true
        }, --  underlined text
        ["@text.underline"] = {
            link = "@markup.underline"
        }, -- @deprecated
        ["@markup.strikethrough"] = {
            strikethrough = true
        }, --  strikethrough
        ["@text.strike"] = {
            link = "@markup.strikethrough"
        }, -- @deprecated
        ["@markup.heading"] = {
            fg = p.orange,
            bold = true
        }, --  generic heading
        ["@markup.heading.1.markdown"] = {
            fg = p.red,
            bold = true
        }, --  h1
        ["@markup.heading.2.markdown"] = {
            fg = p.orange,
            bold = true
        }, --  h2
        ["@markup.heading.3.markdown"] = {
            fg = p.yellow,
            bold = true
        }, --  h3
        ["@markup.heading.4.markdown"] = {
            fg = p.green,
            bold = true
        }, --  h4
        ["@markup.heading.5.markdown"] = {
            fg = p.cyan,
            bold = true
        }, --  h5
        ["@markup.heading.6.markdown"] = {
            fg = p.blue,
            bold = true
        }, --  h6
        ["@text.title"] = {
            link = "@markup.heading"
        }, -- @deprecated
        ["@markup.raw"] = {
            fg = p.green
        }, --  literal / verbatim / code spans
        ["@text.literal"] = {
            link = "@markup.raw"
        }, -- @deprecated
        ["@markup.link.url"] = {
            fg = p.blue,
            underline = true,
            sp = p.blue
        }, --  URIs / hyperlinks
        ["@text.uri"] = {
            link = "@markup.link.url"
        }, -- @deprecated
        ["@markup.link.label"] = {
            fg = p.cyan
        }, --  link labels
        ["@markup.link"] = {
            fg = p.cyan
        }, --  references / footnotes / citations
        ["@text.reference"] = {
            link = "@markup.link"
        }, -- @deprecated
        ["@markup.math"] = {
            fg = p.yellow
        }, --  math environments
        ["@text.math"] = {
            link = "@markup.math"
        }, -- @deprecated
        ["@markup.environment"] = {
            fg = p.violet
        }, --  markup environments (LaTeX)
        ["@text.environment"] = {
            link = "@markup.environment"
        }, -- @deprecated
        ["@markup.environment.name"] = {
            fg = p.orange
        }, --  environment type name
        ["@text.environment.name"] = {
            link = "@markup.environment.name"
        }, -- @deprecated
        ["@markup.list"] = {
            fg = p.fg0
        }, --  list markers
        ["@markup.list.unchecked"] = {
            fg = p.grey0
        }, --  [ ] unchecked list item
        ["@markup.list.checked"] = {
            fg = p.green
        }, --  [x] checked list item
        ["@markup.quote"] = {
            fg = p.grey0,
            italic = true
        }, --  block quotes
        ["@markup.note"] = {
            fg = p.bg0,
            bg = p.green,
            bold = true
        }, --  informational note

        -- Comments: special annotations
        ["@comment.todo"] = {
            fg = p.bg0,
            bg = p.blue,
            bold = true
        }, --  TODO:
        ["@text.todo"] = {
            link = "@comment.todo"
        }, -- @deprecated
        ["@comment.note"] = {
            fg = p.bg0,
            bg = p.green,
            bold = true
        }, --  NOTE:
        ["@text.note"] = {
            link = "@comment.note"
        }, -- @deprecated
        ["@comment.warning"] = {
            fg = p.bg0,
            bg = p.yellow,
            bold = true
        }, --  WARN:
        ["@text.warning"] = {
            link = "@comment.warning"
        }, -- @deprecated
        ["@comment.error"] = {
            fg = p.bg0,
            bg = p.red,
            bold = true
        }, --  ERROR: / FIXME:
        ["@text.danger"] = {
            link = "@comment.error"
        }, -- @deprecated

        -- Diff
        ["@diff.plus"] = {
            link = "DiffAdd"
        }, --  added lines
        ["@text.diff.add"] = {
            link = "DiffAdd"
        }, -- @deprecated
        ["@diff.minus"] = {
            link = "DiffDelete"
        }, --  removed lines
        ["@text.diff.delete"] = {
            link = "DiffDelete"
        }, -- @deprecated
        ["@diff.delta"] = {
            link = "DiffChange"
        }, --  changed lines

        -- Tags (HTML / JSX / XML)
        ["@tag"] = {
            fg = p.red
        }, --  tag names
        ["@tag.attribute"] = {
            fg = p.orange
        }, --  tag attributes
        ["@tag.delimiter"] = {
            fg = p.fg0
        }, --  < > / tag delimiters

        -- Conceal
        ["@conceal"] = {
            fg = p.grey0
        }, --  concealed regions

        -- Language-specific
        ["@constant.git_rebase"] = {
            fg = p.cyan
        },
        ["@property.yaml"] = {
            fg = p.cyan
        },
        ["@character.printf"] = {
            fg = p.yellow
        },

        -- LSP Semantic Token Groups
        ["@lsp.type.class"] = {
            link = "@type"
        },
        ["@lsp.type.comment"] = {
            link = "@comment"
        },
        ["@lsp.type.decorator"] = {
            link = "@function"
        },
        ["@lsp.type.enum"] = {
            link = "@type"
        },
        ["@lsp.type.enumMember"] = {
            link = "@constant"
        },
        ["@lsp.type.events"] = {
            link = "@label"
        },
        ["@lsp.type.field"] = {
            link = "@variable.member"
        },
        ["@lsp.type.function"] = {
            link = "@function"
        },
        ["@lsp.type.interface"] = {
            link = "@type"
        },
        ["@lsp.type.keyword"] = {
            link = "@keyword"
        },
        ["@lsp.type.macro"] = {
            link = "@constant.macro"
        },
        ["@lsp.type.method"] = {
            link = "@function.method"
        },
        ["@lsp.type.modifier"] = {
            link = "@type.qualifier"
        },
        ["@lsp.type.namespace"] = {
            link = "@module"
        },
        ["@lsp.type.number"] = {
            link = "@number"
        },
        ["@lsp.type.operator"] = {
            link = "@operator"
        },
        ["@lsp.type.parameter"] = {
            link = "@variable.parameter"
        },
        ["@lsp.type.property"] = {
            link = "@property"
        },
        ["@lsp.type.regexp"] = {
            link = "@string.regexp"
        },
        ["@lsp.type.string"] = {
            link = "@string"
        },
        ["@lsp.type.struct"] = {
            link = "@type"
        },
        ["@lsp.type.type"] = {
            link = "@type"
        },
        ["@lsp.type.typeParameter"] = {
            link = "@type.definition"
        },
        ["@lsp.type.variable"] = {}, --  defer to treesitter @variable
        ["@lsp.typemod.method.defaultLibrary"] = {
            link = "@function.builtin"
        },
        ["@lsp.typemod.function.defaultLibrary"] = {
            link = "@function.builtin"
        },
        ["@lsp.typemod.operator.injected"] = {
            link = "@operator"
        },
        ["@lsp.typemod.string.injected"] = {
            link = "@string"
        },
        ["@lsp.typemod.variable.defaultLibrary"] = {
            link = "@variable.builtin"
        },
        ["@lsp.typemod.variable.injected"] = {
            link = "@variable"
        }
    }

    for group, hl_opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl_opts)
    end
end

return M
