-- lua/kape/palette/init.lua
-- Palette loader with cache.

---@class Kape.PaletteModule
local M = {}

---@type Kape.Palette|nil
local cache = nil

---@return Kape.Palette
function M.load()
  if cache then
    return cache
  end
  cache = require("kape.palette.kape")
  return cache
end

function M.clear_cache()
  cache = nil
end

return M
