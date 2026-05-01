-- lua/kape/theme/plugins/fzf-lua.lua

---@type Kape.PluginSpec
return {
  name = "ibhagwan/fzf-lua",

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "fzf-lua")
    local bg       = is_clear and "NONE" or c.editor.background
    local panel_bg = c.editorSuggestWidget.background

    -- stylua: ignore
    return {
      -- Main window
      FzfLuaNormal       = { bg = panel_bg, fg = c.base.white },
      FzfLuaBorder       = { bg = bg,        fg = panel_bg },
      FzfLuaTitle        = { bg = c.base.yellow, fg = c.base.black, bold = true },
      FzfLuaBackdrop     = { bg = bg },
      FzfLuaCursor       = { link = "IncSearch" },

      -- Prompt / header
      FzfLuaPrompt       = { bg = c.sideBar.background, fg = c.base.aqua, bold = true },
      FzfLuaSearch       = { bg = c.sideBar.background, fg = c.base.white },
      FzfLuaHeaderBind   = { fg = c.base.yellow },
      FzfLuaHeaderText   = { fg = c.base.dimmed2 },

      -- Preview window
      FzfLuaPreviewNormal = { bg = bg, fg = c.base.white },
      FzfLuaPreviewBorder = { bg = bg, fg = panel_bg },
      FzfLuaPreviewTitle  = { bg = c.base.yellow, fg = c.base.black, bold = true },

      -- fzf internal colors (passed to fzf via --color)
      FzfLuaFzfNormal     = { fg = c.base.white },
      FzfLuaFzfCursorLine = { link = "Visual" },
      FzfLuaFzfPointer    = { fg = c.base.yellow },
      FzfLuaFzfSeparator  = { fg = c.base.dimmed3, bg = panel_bg },
      FzfLuaFzfMatch      = { fg = c.base.blue, bold = true },
      FzfLuaFzfPrompt     = { fg = c.base.aqua },
      FzfLuaFzfGutter     = { bg = panel_bg },

      -- Path display
      -- FzfLuaDirPart  = the directory breadcrumb e.g. "app/components/"
      -- FzfLuaFilePart = the filename e.g. "Content.tsx"
      -- FzfLuaPath     = fallback path group (links to Directory by default)
      FzfLuaDirPart  = { fg = c.base.dimmed2 },
      FzfLuaFilePart = { fg = c.base.white },
      FzfLuaPath     = { fg = c.base.dimmed2 },

      -- Cursor / selection
      FzfLuaCursorLine   = { bg = c.list.activeSelectionBackground, bold = true },
      FzfLuaCursorLineNr = { bg = c.list.activeSelectionBackground, fg = c.base.dimmed2 },

      -- Buffer picker
      FzfLuaBufName      = { fg = c.base.white },
      FzfLuaBufNr        = { fg = c.base.dimmed3 },
      FzfLuaBufFlagCur   = { fg = c.base.yellow },
      FzfLuaBufFlagAlt   = { fg = c.base.dimmed3 },
      FzfLuaBufLineNr    = { fg = c.base.dimmed3 },

      -- Tabs
      FzfLuaTabTitle     = { fg = c.base.yellow, bold = true },
      FzfLuaTabMarker    = { fg = c.base.green,  bold = true },

      -- Live grep / symbols
      FzfLuaLiveSym      = { fg = c.base.orange },

      -- Scrollbar
      FzfLuaScrollFloat  = { bg = panel_bg, fg = c.base.dimmed3 },
      FzfLuaScrollBorder = { bg = panel_bg, fg = c.base.dimmed4 },

      -- Path line/col numbers (grep results)
      FzfLuaPathColNr    = { fg = c.base.blue },
      FzfLuaPathLineNr   = { fg = c.base.green },
    }
  end,
}
