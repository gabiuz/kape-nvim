-- lua/kape/theme/plugins/nvim-tree.lua

---@type Kape.PluginSpec
return {
  name = "nvim-tree/nvim-tree.lua",
  lazy = { module = "nvim-tree" },

  highlights = function(c, config)
    local is_clear  = vim.tbl_contains(config.background_clear or {}, "nvim-tree")
    local sidebar_bg = is_clear and c.editor.background or c.sideBar.background

    -- stylua: ignore
    return {
      -- Base window
      NvimTreeNormal       = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NvimTreeNormalFloat  = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NvimTreeNormalNC     = { fg = c.base.dimmed2,       bg = sidebar_bg },
      NvimTreeEndOfBuffer  = { fg = sidebar_bg },
      NvimTreeVertSplit    = { fg = c.editor.background,  bg = c.editor.background },
      NvimTreeCursorLine   = { bg = c.list.activeSelectionBackground },
      NvimTreeCursorColumn = { bg = c.list.activeSelectionBackground },
      NvimTreeWinSeparator = { fg = is_clear and c.base.black or c.editor.background, bg = c.editor.background },

      -- Files & folders
      NvimTreeRootFolder        = { link = "KapeGrey" },
      NvimTreeFolderIcon        = { link = "KapeOrange" },
      NvimTreeFolderName        = { link = "KapeGreen" },
      NvimTreeOpenedFolderName  = { link = "KapeGreen" },
      NvimTreeEmptyFolderName   = { link = "KapeGreen" },
      NvimTreeFileName          = { link = "KapeFg" },
      NvimTreeFileIcon          = { link = "KapeFg" },
      NvimTreeSpecialFile       = { link = "KapeFg" },
      NvimTreeSymlink           = { link = "KapeCyan" },
      NvimTreeSymlinkIcon       = { link = "KapeFg" },
      NvimTreeSymlinkFolderName = { link = "KapeGreen" },
      NvimTreeImageFile         = { link = "KapeFg" },
      NvimTreeExecFile          = { link = "KapeFg" },
      NvimTreeIndentMarker      = { link = "KapeGrey" },

      -- Git status
      NvimTreeGitDirty   = { link = "KapeYellow" },
      NvimTreeGitStaged  = { link = "KapeBlue" },
      NvimTreeGitMerge   = { link = "KapeOrange" },
      NvimTreeGitRenamed = { link = "KapeViolet" },
      NvimTreeGitNew     = { link = "KapeCyan" },
      NvimTreeGitDeleted = { link = "KapeRed" },
      NvimTreeGitIgnored = { link = "KapeGrey" },

      -- Diagnostics
      NvimTreeLspDiagnosticsError       = { link = "KapeRedSign" },
      NvimTreeLspDiagnosticsWarning     = { link = "KapeYellowSign" },
      NvimTreeLspDiagnosticsInformation = { link = "KapeBlueSign" },
      NvimTreeLspDiagnosticsHint        = { link = "KapeCyanSign" },

      -- Misc
      NvimTreePopup            = { fg = c.base.white,   bg = c.editorSuggestWidget.background },
      NvimTreeBookmark         = { link = "KapeViolet" },
      NvimTreeLiveFilterPrefix = { link = "KapeRed" },
      NvimTreeLiveFilterValue  = { fg = c.base.white, bold = true },
    }
  end,
}
