-- lua/kape/theme/triggers/init.lua
-- Trigger state management for lazy-loading plugin highlights.

local colors = require("kape.colors")

---@class Kape.TriggerState
local M = {}

--- Track which plugins have had their highlights applied
---@type table<string, boolean>
M.applied_plugins = {}

--- Module → plugin name mapping for require() interception
---@type table<string, string>
M.module_to_plugin = {}

--- Pending lazy specs (need scheme/config to apply)
---@type table<string, Kape.PluginSpec>
M.pending_specs = {}

--- Current scheme (set by plugins/init.lua at load time)
---@type Kape.Scheme|nil
M.scheme = nil

--- Current config (set by plugins/init.lua at load time)
---@type Kape.Config|nil
M.config = nil

--- Apply highlights for a plugin
---@param plugin_name string
function M.apply(plugin_name)
  if M.applied_plugins[plugin_name] then
    return
  end

  local spec = M.pending_specs[plugin_name]
  if not spec or not M.scheme then
    return
  end

  local highlights = spec.highlights(M.scheme, M.config)
  colors.apply_highlights(highlights)

  M.applied_plugins[plugin_name] = true
  M.pending_specs[plugin_name] = nil
end

return M
