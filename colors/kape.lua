-- colors/kape.lua
-- Neovim colorscheme entry point.
-- Neovim sources this file when the user does `colorscheme kape`.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name   = "kape"

-- Clear the module cache so edits to any kape.* module take effect immediately.
for k in pairs(package.loaded) do
  if k:match("^kape") then
    package.loaded[k] = nil
  end
end

-- If the user has already called require("kape").setup(...) via their plugin
-- manager, config is already merged. If not, load with defaults.
local ok, kape = pcall(require, "kape")
if ok then
  kape.load()
end
