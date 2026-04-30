-- lua/kape/theme/plugins/init.lua
-- Plugin registry with auto-discovery and lazy loading support.

---@class Kape.Theme.Plugins
local M = {}

local state         = require("kape.theme.triggers")
local event_trigger = require("kape.theme.triggers.event")
local module_trigger = require("kape.theme.triggers.module")

--- Cache for loaded specs
---@type Kape.PluginSpec[]|nil
local specs_cache = nil

--- Discover and load all plugin specs from this directory
---@return Kape.PluginSpec[]
function M.load_specs()
  if specs_cache then
    return specs_cache
  end

  local specs = {}
  local plugin_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

  for _, file in ipairs(vim.fn.glob(plugin_dir .. "/*.lua", false, true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      local module_path = "kape.theme.plugins." .. name
      local ok, spec = pcall(require, module_path)
      if ok and type(spec) == "table" and spec.highlights then
        table.insert(specs, spec)
      end
    end
  end

  specs_cache = specs
  return specs
end

--- Check if a plugin is enabled
---@param spec   Kape.PluginSpec
---@param config Kape.Config
---@return boolean
local function is_enabled(spec, config)
  if config.disabled_plugins and vim.tbl_contains(config.disabled_plugins, spec.name) then
    return false
  end

  local enabled = spec.enabled
  if enabled == nil or enabled == true then return true end
  if enabled == false then return false end
  if type(enabled) == "function" then return enabled(config) end
  return true
end

--- Generate all plugin highlights (eager ones immediately, lazy ones deferred)
---@param scheme Kape.Scheme
---@param config Kape.Config
---@return table<string, vim.api.keyset.highlight>
function M.generate(scheme, config)
  local highlights = {}

  -- Store scheme/config so lazy triggers can apply later
  state.scheme = scheme
  state.config = config

  -- Install module loader once
  module_trigger.install()

  for _, spec in ipairs(M.load_specs()) do
    if not is_enabled(spec, config) then
      goto continue
    end

    local lazy_config = spec.lazy
    local eager = lazy_config == false or lazy_config == nil or state.applied_plugins[spec.name] == true

    if eager then
      local plugin_highlights = spec.highlights(scheme, config)
      highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights)
      state.applied_plugins[spec.name] = true
    else
      assert(lazy_config ~= nil, "Lazy config should not be nil here")
      state.pending_specs[spec.name] = spec

      if lazy_config.event then
        event_trigger.setup(spec, lazy_config.event)
      end
      if lazy_config.module then
        module_trigger.setup(spec, lazy_config.module)
      end
    end

    ::continue::
  end

  return highlights
end

--- Clear the specs cache
function M.clear_cache()
  specs_cache = nil
end

return M
