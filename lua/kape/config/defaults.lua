-- lua/kape/config/defaults.lua
-- Type annotations and default values for Kape's configuration.

---@class Kape.Config.Styles
---@field comment?   vim.api.keyset.highlight
---@field keyword?   vim.api.keyset.highlight
---@field type?      vim.api.keyset.highlight
---@field parameter? vim.api.keyset.highlight

---@class Kape.Config.Plugins.Bufferline
---@field underline_selected? boolean
---@field underline_visible?  boolean
---@field underline_fill?     boolean
---@field bold?               boolean

---@class Kape.Config.Plugins
---@field bufferline? Kape.Config.Plugins.Bufferline

---@class Kape.Config
---@field transparent_background?   boolean
---@field terminal_colors?          boolean
---@field styles?                   Kape.Config.Styles
---@field diagnostic_virtual_text?  "colored"|"grey"
---@field background_clear?         string[]     Plugin names that should have bg cleared
---@field disabled_plugins?         string[]     Plugin names to skip highlight generation for
---@field plugins?                  Kape.Config.Plugins
---@field override?                 fun(scheme: Kape.Scheme): table<string, vim.api.keyset.highlight>
---@field override_scheme?          fun(scheme: Kape.Scheme, palette: Kape.Palette, colors: Kape.Colors): Kape.Scheme

---@type Kape.Config
local defaults = {
  transparent_background  = false,
  terminal_colors         = true,
  styles = {
    comment   = { italic = true },
    keyword   = { italic = false },
    type      = { italic = true },
    parameter = { italic = false },
  },
  diagnostic_virtual_text = "colored",
  background_clear        = {},
  disabled_plugins        = {},
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible  = false,
      underline_fill     = false,
      bold               = true,
    },
  },
  override        = nil,
  override_scheme = nil,
}

return defaults
