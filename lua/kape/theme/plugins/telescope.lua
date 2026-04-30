-- lua/kape/theme/plugins/telescope.lua

---@type Kape.PluginSpec
return {
  name = "nvim-telescope/telescope.nvim",
  lazy = { module = "telescope" },

  highlights = function(c, config)
    local is_clear  = vim.tbl_contains(config.background_clear or {}, "telescope")
    local bg        = is_clear and "NONE" or c.editor.background
    local panel_bg  = c.editorSuggestWidget.background
    local prompt_bg = c.editorIndentGuide.background

    -- stylua: ignore
    return {
      -- Selection
      TelescopeSelection      = { bg = c.list.activeSelectionBackground, bold = true },
      TelescopeSelectionCaret = { bg = c.list.activeSelectionBackground, fg = c.base.green },
      TelescopeMultiSelection = { bg = c.diffEditor.modifiedLineBackground, fg = c.base.cyan },
      TelescopeMultiIcon      = { fg = c.base.cyan },

      -- Global
      TelescopeNormal      = { bg = panel_bg, fg = c.base.white },
      TelescopeBorder      = { bg = bg,        fg = bg },
      TelescopeMatching    = { fg = c.base.blue, bold = true },
      TelescopePreviewLine = { link = "TelescopeSelection" },

      -- Prompt
      TelescopePromptTitle   = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePromptNormal  = { bg = prompt_bg,     fg = c.base.white },
      TelescopePromptBorder  = { bg = bg,            fg = prompt_bg },
      TelescopePromptPrefix  = { fg = c.base.cyan },
      TelescopePromptCounter = { fg = c.base.red,    bold = true },

      -- Preview
      TelescopePreviewTitle  = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePreviewNormal = { bg = panel_bg,      fg = c.base.white },
      TelescopePreviewBorder = { bg = bg,            fg = panel_bg },

      -- Results
      TelescopeResultsTitle  = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopeResultsNormal = { bg = panel_bg,      fg = c.base.white },
      TelescopeResultsBorder = { bg = bg,            fg = panel_bg },

      -- Result row content
      -- File names and paths in the results list (the "breadcrumb" text)
      TelescopeResultsFileName  = { bg = panel_bg, fg = c.base.white },
      TelescopeResultsFilePath  = { bg = panel_bg, fg = c.base.dimmed2 },
      TelescopePathSeparator    = { bg = panel_bg, fg = c.base.dimmed3 },
      TelescopeResultsClass     = { fg = c.base.green },
      TelescopeResultsConstant  = { fg = c.base.yellow },
      TelescopeResultsField     = { fg = c.base.yellow },
      TelescopeResultsFunction  = { fg = c.base.orange },
      TelescopeResultsMethod    = { fg = c.base.orange },
      TelescopeResultsOperator  = { fg = c.base.white },
      TelescopeResultsStruct    = { fg = c.base.cyan },
      TelescopeResultsVariable  = { fg = c.base.white },
      TelescopeResultsIdentifier = { fg = c.base.white },
      TelescopeResultsNumber    = { fg = c.base.yellow },
      TelescopeResultsComment   = { fg = c.base.dimmed3 },
      TelescopeResultsSpecialComment = { fg = c.base.dimmed3 },

      -- Line numbers in results
      TelescopeResultsLineNr    = { fg = c.base.dimmed3 },
    }
  end,
}
