-- lua/kape/theme/groups/editor.lua
-- Core Neovim editor highlight groups.

local colors = require("kape.colors")

---@type Kape.GroupSpec
return {
  name = "editor",

  highlights = function(scheme, config)
    return {
      -- Normal
      Normal    = { bg = scheme.editor.background, fg = scheme.editor.foreground },
      NormalNC  = { bg = scheme.editor.background, fg = scheme.base.dimmed2 },
      NormalFloat = { bg = scheme.editor.background, fg = scheme.base.dimmed1 },

      -- Cursor
      Cursor       = { bg = scheme.base.white, fg = scheme.base.black },
      CursorIM     = { link = "Cursor" },
      vCursor      = { link = "Cursor" },
      iCursor      = { link = "Cursor" },
      lCursor      = { link = "Cursor" },
      TermCursor   = { link = "Cursor" },
      CursorLine   = { bg = scheme.editor.lineHighlightBackground },
      CursorColumn = { bg = scheme.editor.lineHighlightBackground },
      CursorLineNr = {
        bg   = scheme.editor.background,
        fg   = scheme.editorLineNumber.activeForeground,
        bold = true,
      },

      -- Lines & columns
      ColorColumn = { bg = scheme.base.dimmed5 },
      LineNr      = { fg = scheme.editorLineNumber.foreground },
      SignColumn  = { bg = scheme.editor.background },
      FoldColumn  = { bg = scheme.editor.background, fg = scheme.editorLineNumber.activeForeground },
      Folded      = { bg = scheme.editor.foldBackground },

      -- Splits & borders
      VertSplit    = { bg = scheme.editor.background, fg = scheme.base.black },
      WinSeparator = { fg = scheme.base.black },
      WinBar       = { fg = scheme.base.dimmed2, bg = scheme.editor.background },
      WinBarNC     = { fg = scheme.base.dimmed3, bg = scheme.editor.background },

      -- Float
      FloatBorder = { bg = scheme.editor.background, fg = scheme.editorSuggestWidget.foreground },
      FloatTitle  = { bg = scheme.base.yellow, fg = scheme.base.black, bold = true },

      -- Status & tab line
      StatusLine    = { bg = scheme.statusBar.background, fg = scheme.statusBar.activeForeground },
      StatusLineNC  = { bg = scheme.statusBar.background, fg = scheme.statusBar.foreground },
      TabLine       = { bg = scheme.tab.inactiveBackground, fg = scheme.tab.inactiveForeground },
      TabLineFill   = { bg = scheme.editorGroupHeader.tabsBackground },
      TabLineSel    = { bg = scheme.tab.activeBackground, fg = scheme.tab.activeForeground, bold = true },
      ToolbarLine   = { fg = scheme.base.white },
      ToolbarButton = { fg = scheme.base.black, bg = scheme.base.dimmed2 },

      -- Popup menu
      Pmenu      = { bg = scheme.editorSuggestWidget.background, fg = scheme.editorSuggestWidget.foreground },
      PmenuSel   = { bg = scheme.editorSuggestWidget.selectedBackground, bold = true },
      PmenuSbar  = { bg = colors.lighten(scheme.editorSuggestWidget.background, -10) },
      PmenuThumb = { bg = scheme.scrollbarSlider.hoverBackground },
      WildMenu   = { link = "PmenuSel" },

      -- Search
      Search    = { bg = scheme.editor.findMatchHighlightBackground },
      IncSearch = { bg = scheme.base.yellow, fg = scheme.base.black, bold = true },
      CurSearch = { link = "IncSearch" },
      Substitute = { bg = scheme.base.yellow, fg = scheme.base.black },

      -- Visual
      Visual    = { bg = scheme.editor.selectionBackground },
      VisualNOS = { link = "Visual" },

      -- Misc editor
      Conceal      = { fg = scheme.base.dimmed3 },
      Directory    = { fg = scheme.base.green },
      EndOfBuffer  = { fg = scheme.editor.background },
      ErrorMsg     = { bg = scheme.editor.background, fg = scheme.inputValidation.errorForeground },
      WarningMsg   = { fg = scheme.inputValidation.warningForeground },
      ModeMsg      = { link = "Normal" },
      MsgArea      = { link = "ModeMsg" },
      MsgSeparator = { link = "ModeMsg" },
      MoreMsg      = { fg = scheme.base.yellow },
      NonText      = { fg = scheme.base.dimmed4 },
      Whitespace   = { fg = scheme.base.dimmed4 },
      SpecialKey   = { fg = scheme.base.purple },
      Question     = { fg = scheme.base.yellow },
      QuickFixLine = { fg = scheme.base.purple, bold = true },
      MatchParen   = { fg = scheme.base.yellow, bold = true, underline = true },
      Terminal     = { fg = scheme.editor.foreground, bg = scheme.editor.background },

      -- Title
      Title = { fg = scheme.base.yellow, bold = true },

      -- Directory
      Directory = {
        bg = scheme.editorGroupHeader.tabsBackground,
        fg = scheme.statusBar.foreground,
      },

      -- Spell
      SpellBad   = { fg = scheme.base.red,     sp = scheme.base.red,     undercurl = true },
      SpellCap   = { fg = scheme.base.blue,    sp = scheme.base.blue,    undercurl = true },
      SpellLocal = { fg = scheme.base.aqua,    sp = scheme.base.aqua,    undercurl = true },
      SpellRare  = { fg = scheme.base.purple, sp = scheme.base.purple, undercurl = true },

      -- Diff
      DiffAdd    = { bg = scheme.diffEditor.insertedLineBackground, fg = scheme.diffEditorOverview.insertedForeground },
      DiffChange = { bg = scheme.diffEditor.modifiedLineBackground, fg = scheme.diffEditorOverview.modifiedForeground },
      DiffDelete = { bg = scheme.diffEditor.removedLineBackground,  fg = scheme.diffEditorOverview.removedForeground },
      DiffText   = { bg = scheme.editor.background, fg = scheme.editor.foreground },
      diffAdded   = { fg = scheme.base.green },
      diffRemoved = { fg = scheme.base.red },
      diffChanged = { fg = scheme.base.yellow },
      diffFile    = { fg = scheme.base.yellow },
      diffNewFile = { fg = scheme.base.yellow },
      diffLine    = { fg = scheme.base.aqua },
      Added   = { fg = scheme.base.green },
      Removed = { fg = scheme.base.red },
      Changed = { fg = scheme.base.blue },

      -- Debugging
      debugPC         = { fg = scheme.base.black, bg = scheme.base.green },
      debugBreakpoint = { fg = scheme.base.black, bg = scheme.base.red },

      -- Health
      healthError   = { fg = scheme.base.red },
      healthSuccess = { fg = scheme.base.green },
      healthWarning = { fg = scheme.base.yellow },
    }
  end,
}
