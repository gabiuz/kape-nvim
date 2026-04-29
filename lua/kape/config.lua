-- lua/kape/config.lua
-- Centralizes all theme options as a Lua table instead of g: vars.

local M = {}

M.defaults = {
	transparent_background = false,
	italic_comments = true,
	diagnostic_virtual_text = "colored", -- "colored" | "grey"
}

--- Return a config table merged with user overrides.
---@param opts table|nil
---@return table
function M.get(opts)
	return vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
