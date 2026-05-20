-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use basedpyright instead of pyright (richer inlay hints, stricter inference)
vim.g.lazyvim_python_lsp = "basedpyright"

-- Absolute line numbers only
vim.opt.relativenumber = false

-- Tighter gutter with explicit padding between number and code
vim.opt.statuscolumn = "%s%=%l "
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes:1"
