-- lua/kape/commands.lua
-- User commands for the Kape colorscheme.

---@class Kape.Commands
local M = {}

--- Create Kape user commands
function M.create()
  local cmd = vim.api.nvim_create_user_command

  -- KapeReload: reload the colorscheme (useful during development)
  cmd("KapeReload", function()
    require("kape").load()
  end, {
    desc  = "Reload the Kape colorscheme",
    nargs = 0,
  })

  -- KapeInfo: print current config
  cmd("KapeInfo", function()
    local config = require("kape.config").get()
    vim.notify(vim.inspect(config), vim.log.levels.INFO, { title = "Kape Config" })
  end, {
    desc  = "Show the current Kape configuration",
    nargs = 0,
  })
end

return M
