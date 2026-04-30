-- lua/kape/theme/plugins/telescope.lua

---@type Kape.PluginSpec
return {
  name = "nvim-telescope/telescope.nvim",
  lazy = { module = "telescope" },

  highlights = function(c, config)
    local is_clear = vim.tbl_contains(config.background_clear or {}, "telescope")
    local bg       = is_clear and "NONE" or c.editor.background
    local panel_bg = c.editorSuggestWidget.background
    local prompt_bg = c.editorIndentGuide.background

    -- stylua: ignore
    return {
      TelescopeSelection      = { bg = c.list.activeSelectionBackground, bold = true },
      TelescopeSelectionCaret = { bg = c.list.activeSelectionBackground, fg = c.base.green },
      TelescopeMultiSelection = { bg = c.diffEditor.modifiedLineBackground, fg = c.base.cyan },
      TelescopeMultiIcon      = { fg = c.base.cyan },
      TelescopeNormal         = { bg = panel_bg,  fg = c.base.white },
      TelescopeBorder         = { bg = bg,         fg = bg },
      TelescopeMatching       = { fg = c.base.blue, bold = true },
      TelescopePreviewLine    = { link = "TelescopeSelection" },
      TelescopePromptTitle    = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePromptNormal   = { bg = prompt_bg,    fg = c.base.white },
      TelescopePromptBorder   = { bg = bg,           fg = prompt_bg },
      TelescopePromptPrefix   = { fg = c.base.cyan },
      TelescopePromptCounter  = { fg = c.base.red,   bold = true },
      TelescopePreviewTitle   = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopePreviewNormal  = { bg = panel_bg,     fg = c.base.white },
      TelescopePreviewBorder  = { bg = bg,           fg = panel_bg },
      TelescopeResultsTitle   = { bg = c.base.yellow, fg = c.base.black, bold = true },
      TelescopeResultsNormal  = { bg = panel_bg,     fg = c.base.white },
      TelescopeResultsBorder  = { bg = bg,           fg = panel_bg },
    }
  end,
}
