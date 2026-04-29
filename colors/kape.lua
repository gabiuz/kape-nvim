vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "kape"

-- Clear module cache so edits to any kape.* file take effect immediately
for k in pairs(package.loaded) do
	if k:match("^kape") then
		package.loaded[k] = nil
	end
end

require("kape").setup()
