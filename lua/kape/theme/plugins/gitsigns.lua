-- lua/kape/theme/plugins/gitsigns.lua

---@type Kape.PluginSpec
return {
  name = "lewis6991/gitsigns.nvim",
  lazy = { module = "gitsigns" },

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      SignAdd    = { fg = scheme.editorGutter.addedBackground },
      SignChange = { fg = scheme.editorGutter.modifiedBackground },
      SignDelete = { fg = scheme.editorGutter.deletedBackground },

      GitSignsAdd              = { link = "KapeGreenSign" },
      GitSignsChange           = { link = "KapeBlueSign" },
      GitSignsDelete           = { link = "KapeRedSign" },
      GitSignsAddNr            = { link = "KapeGreen" },
      GitSignsChangeNr         = { link = "KapeBlue" },
      GitSignsDeleteNr         = { link = "KapeRed" },
      GitSignsAddLn            = { link = "DiffAdd" },
      GitSignsChangeLn         = { link = "DiffChange" },
      GitSignsDeleteLn         = { link = "DiffDelete" },
      GitSignsCurrentLineBlame = { fg = scheme.base.dimmed4 },
      GitSignsAddInline        = { link = "DiffAdd" },
      GitSignsChangeInline     = { link = "DiffChange" },
      GitSignsDeleteInline     = { link = "DiffDelete" },
    }
  end,
}
