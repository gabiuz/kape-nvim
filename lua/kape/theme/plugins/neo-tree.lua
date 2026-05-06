-- lua/kape/theme/plugins/neo-tree.lua

---@type Kape.PluginSpec
return {
  name = "nvim-neo-tree/neo-tree.nvim",
  lazy = { module = "neo-tree" },

  highlights = function(c, config)
    local is_clear  = vim.tbl_contains(config.background_clear or {}, "neo-tree")
    local transparent = config.transparent
    local sidebar_bg = transparent and "NONE" or (is_clear and c.editor.background or c.sideBar.background)
    local float_bg = transparent and "NONE" or c.editorSuggestWidget.background

    -- stylua: ignore
    return {
      -- Base window
      NeoTreeNormal               = { fg = c.sideBar.foreground,             bg = sidebar_bg },
      NeoTreeNormalNC             = { fg = c.sideBar.foreground,             bg = sidebar_bg },
      NeoTreeSignColumn           = { fg = c.sideBar.foreground,             bg = sidebar_bg },
      NeoTreeStatusLine           = { fg = sidebar_bg,                       bg = sidebar_bg },
      NeoTreeStatusLineNC         = { fg = sidebar_bg,                       bg = sidebar_bg },
      NeoTreeEndOfBuffer          = { fg = sidebar_bg,                       bg = sidebar_bg },
      NeoTreeWinSeparator         = { fg = is_clear and c.base.black or c.editor.background, bg = c.editor.background },

      -- Cursor
      NeoTreeCursor               = { bg = c.list.activeSelectionBackground },
      NeoTreeCursorLine           = { bg = c.list.activeSelectionBackground, bold = true },
      NeoTreeCursorLineSign       = { bg = c.list.activeSelectionBackground },

      -- Root & directory
      NeoTreeRootName             = { fg = c.sideBarSectionHeader.foreground, bold = true },
      NeoTreeDirectoryIcon        = { fg = c.sideBar.foreground },
      NeoTreeDirectoryName        = { fg = c.sideBar.foreground },
      NeoTreeExpander             = { link = "NeoTreeDirectoryIcon" },

      -- Files
      NeoTreeFileName             = { fg = c.sideBar.foreground },
      NeoTreeFileNameOpened       = { fg = c.sideBar.foreground,             bold = true },
      NeoTreeFileIcon             = { fg = c.sideBar.foreground },
      NeoTreeSymbolicLinkTarget   = { link = "KapeAqua" },

      -- Hidden / faded
      NeoTreeDotfile              = { link = "KapeGrey" },
      NeoTreeHiddenByName         = { link = "KapeGrey" },
      NeoTreeWindowsHidden        = { link = "KapeGrey" },
      NeoTreeDimText              = { fg = c.base.dimmed3 },
      NeoTreeFadeText1            = { fg = c.base.dimmed3 },
      NeoTreeFadeText2            = { fg = c.base.dimmed4 },
      NeoTreeIndentMarker         = { fg = c.editorIndentGuide.background },
      NeoTreeMessage              = { fg = c.base.dimmed3, italic = true },

      -- Modified / filter
      NeoTreeModified             = { link = "KapeYellow" },
      NeoTreeFilterTerm           = { link = "KapeAqua" },
      NeoTreeBufferNumber         = { link = "KapeOrange" },
      NeoTreePreview              = { link = "Search" },

      -- File stats
      NeoTreeFileStats            = { fg = c.base.dimmed3 },
      NeoTreeFileStatsHeader      = { fg = c.base.dimmed3, bold = true, italic = true },

      -- Float / popup
      NeoTreeFloatNormal          = { fg = c.editorSuggestWidget.foreground,  bg = float_bg },
      NeoTreeFloatBorder          = { fg = c.editorSuggestWidget.background,  bg = sidebar_bg },
      NeoTreeTitleBar             = { fg = c.base.yellow,                      bg = float_bg, bold = true },
      NeoTreeFloatTitle           = { fg = c.base.yellow,                      bg = sidebar_bg, bold = true },

      -- Tabs
      NeoTreeTabActive            = { fg = c.button.foreground, bg = c.button.hoverBackground, bold = true },
      NeoTreeTabInactive          = { fg = c.button.foreground, bg = c.button.background },
      NeoTreeTabSeparatorActive   = { fg = c.button.separator, bg = c.button.hoverBackground },
      NeoTreeTabSeparatorInactive = { fg = c.button.separator, bg = c.button.background },

      -- Git status
      NeoTreeGitAdded             = { fg = c.gitDecoration.addedResourceForeground },
      NeoTreeGitConflict          = { fg = c.gitDecoration.conflictingResourceForeground, bold = true, italic = true },
      NeoTreeGitDeleted           = { fg = c.gitDecoration.deletedResourceForeground },
      NeoTreeGitIgnored           = { fg = c.gitDecoration.ignoredResourceForeground },
      NeoTreeGitModified          = { fg = c.gitDecoration.modifiedResourceForeground },
      NeoTreeGitStaged            = { fg = c.gitDecoration.stageModifiedResourceForeground },
      NeoTreeGitRenamed           = { fg = c.gitDecoration.untrackedResourceForeground },
      NeoTreeGitUntracked         = { fg = c.gitDecoration.untrackedResourceForeground },
      NeoTreeGitUnstaged          = { link = "KapeOrange" },
    }
  end,
}
