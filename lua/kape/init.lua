-- lua/kape/init.lua
-- Public API for the Kape colorscheme.

---@class Kape
local M = {}

local config_module = require("kape.config")
local theme_module  = require("kape.theme")

--- Configure Kape without applying highlights.
--- Call this from your plugin manager's setup (e.g., lazy.nvim opts).
---@param user_config? Kape.Config
function M.setup(user_config)
  config_module.setup(user_config)

  local commands = require("kape.commands")
  commands.create()
end

--- Apply the colorscheme.
--- Called from colors/kape.lua automatically, or manually to reload.
function M.load()
  theme_module.load()
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })
end

--- Get the current configuration.
---@return Kape.Config
function M.get_config()
  return config_module.get()
end

--- Get the current color scheme (palette → scheme).
---@return Kape.Scheme
function M.get_scheme()
  return theme_module.get_scheme()
end

--- Get color utilities (blend, lighten, etc.).
---@return Kape.Colors
function M.get_colors()
  return require("kape.colors")
end

--- Get the Kape palette.
---@return Kape.Palette
function M.get_palette()
  return require("kape.palette").load()
end

return M
