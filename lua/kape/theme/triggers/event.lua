-- lua/kape/theme/triggers/event.lua
-- Event-based lazy loading trigger (autocmd).

local state = require("kape.theme.triggers")

local M = {}

--- Check if an event has already fired
---@param event string
---@return boolean
local function event_already_fired(event)
  if event == "VimEnter" or event == "UIEnter" then
    return vim.v.vim_did_enter == 1
  end
  return false
end

--- Setup autocmd trigger for a plugin
---@param spec    Kape.PluginSpec     Plugin spec
---@param events  string|string[]     Event(s) to trigger on
function M.setup(spec, events)
  if type(events) == "string" then
    events = { events }
  end

  for _, event in ipairs(events) do
    if event_already_fired(event) then
      state.apply(spec.name)
      return
    end
  end

  vim.api.nvim_create_autocmd(events, {
    once = true,
    callback = function()
      state.apply(spec.name)
    end,
  })
end

return M
