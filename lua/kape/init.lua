local M = {}

local function load_integration(name, p)
	local ok, integration = pcall(require, "kape.highlights.integrations." .. name)
	if ok then
		integration(p)
	end
end

function M.setup()
	local p = require("kape.palette").palette

	require("kape.highlights.base")(p)
	require("kape.highlights.treesitter")(p)

	load_integration("telescope", p)
	load_integration("nvimtree", p)
	load_integration("bufferline", p)
	load_integration("lualine", p)
end

return M
