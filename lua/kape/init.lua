local M = {}

local function load_integration(name, p, opts)
	local ok, integration = pcall(require, "kape.highlights.integrations." .. name)
	if ok then
		integration(p, opts)
	end
end

M.options = {
	transparent = false,
}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
	local p = require("kape.palette").palette

	vim.o.termguicolors = true

	require("kape.highlights.base")(p, M.options)

	load_integration("telescope", p, M.options)
	load_integration("nvimtree", p, M.options)
	load_integration("bufferline", p, M.options)
	load_integration("lualine", p)
end

return M
