-- lua/kape/init.lua
-- Loads highlight modules in order: semantic → editor → syntax →
-- treesitter → lsp → plugins.

local M = {}

M.options = {}

---@param opts table|nil Options to override defaults (see lua/kape/config.lua)
function M.setup(opts)
	local config  = require("kape.config")
	M.options     = config.get(opts)

	local p = require("kape.palette").palette

	vim.o.termguicolors = true

	require("kape.highlights.semantic")(p, M.options)
	require("kape.highlights.editor")(p, M.options)
	require("kape.highlights.syntax")(p, M.options)
	require("kape.highlights.treesitter")(p, M.options)
	require("kape.highlights.lsp")(p, M.options)

	require("kape.highlights.telescope")(p, M.options)
	require("kape.highlights.nvimtree")(p, M.options)
	require("kape.highlights.bufferline")(p, M.options)
end

return M
