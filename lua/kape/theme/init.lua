-- lua/kape/theme/init.lua
-- Orchestrates palette → scheme → highlights → apply.

local config_module  = require("kape.config")
local palette_module = require("kape.palette")
local scheme_module  = require("kape.theme.scheme")
local colors         = require("kape.colors")

---@class Kape.ThemeModule
local M = {}

--- Set terminal colors from the scheme
---@param scheme Kape.Scheme
local function set_terminal_colors(scheme)
  vim.g.terminal_color_0  = scheme.base.black
  vim.g.terminal_color_8  = scheme.base.dimmed3

  vim.g.terminal_color_7  = scheme.base.white
  vim.g.terminal_color_15 = scheme.base.white

  vim.g.terminal_color_1  = scheme.base.red
  vim.g.terminal_color_9  = scheme.base.red

  vim.g.terminal_color_2  = scheme.base.green
  vim.g.terminal_color_10 = scheme.base.green

  vim.g.terminal_color_3  = scheme.base.yellow
  vim.g.terminal_color_11 = scheme.base.yellow

  vim.g.terminal_color_4  = scheme.base.blue
  vim.g.terminal_color_12 = scheme.base.blue

  vim.g.terminal_color_5  = scheme.base.magenta
  vim.g.terminal_color_13 = scheme.base.magenta

  vim.g.terminal_color_6  = scheme.base.cyan
  vim.g.terminal_color_14 = scheme.base.cyan
end

--- Build the complete highlight table
---@param scheme Kape.Scheme
---@param config Kape.Config
---@return table<string, vim.api.keyset.highlight>
local function build_highlights(scheme, config)
  local highlights = {}

  local groups  = require("kape.theme.groups")
  highlights = vim.tbl_deep_extend("force", highlights, groups.generate(scheme, config))

  local plugins = require("kape.theme.plugins")
  highlights = vim.tbl_deep_extend("force", highlights, plugins.generate(scheme, config))

  if config.override then
    local user_overrides = config.override(scheme)
    if user_overrides then
      highlights = vim.tbl_deep_extend("force", highlights, user_overrides)
    end
  end

  return highlights
end

--- Build the theme (palette → scheme → highlights)
---@return table<string, vim.api.keyset.highlight>
function M.build()
  local config  = config_module.get()
  local palette = palette_module.load()
  local scheme  = scheme_module.build(palette, config)

  if config.override_scheme then
    local overrides = config.override_scheme(scheme, palette, colors)
    if overrides then
      scheme = vim.tbl_deep_extend("force", scheme, overrides)
    end
  end

  return build_highlights(scheme, config)
end

--- Load and apply the colorscheme
function M.load()
  if vim.g.colors_name then
    vim.cmd([[hi clear]])
  end

  vim.o.termguicolors = true
  vim.g.colors_name   = "kape"

  local config     = config_module.get()
  local highlights = M.build()
  colors.apply_highlights(highlights)

  if config.terminal_colors then
    local palette = palette_module.load()
    local scheme  = scheme_module.build(palette, config)
    set_terminal_colors(scheme)
  end
end

--- Clear all caches (used when reloading)
function M.clear_cache()
  palette_module.clear_cache()

  local groups  = require("kape.theme.groups")
  local plugins = require("kape.theme.plugins")
  groups.clear_cache()
  plugins.clear_cache()
end

--- Get the current scheme (for external use)
---@return Kape.Scheme
function M.get_scheme()
  local config  = config_module.get()
  local palette = palette_module.load()
  return scheme_module.build(palette, config)
end

return M
