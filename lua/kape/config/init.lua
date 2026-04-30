-- lua/kape/config/init.lua
-- Runtime configuration state module.

---@class Kape.ConfigModule
local M = {}

local defaults = require("kape.config.defaults")

---@type Kape.Config
local current_config = vim.deepcopy(defaults)

--- Setup the configuration with user overrides
---@param user_config? Kape.Config
function M.setup(user_config)
  current_config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), user_config or {})
end

--- Extend the current configuration (used when reloading)
---@param user_config? Kape.Config
function M.extend(user_config)
  current_config = vim.tbl_deep_extend("force", current_config, user_config or {})
end

--- Get the current configuration
---@return Kape.Config
function M.get()
  return current_config
end

return M
