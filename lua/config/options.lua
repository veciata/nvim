-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Set options
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = true
opt.showcmd = true
opt.scrolloff = 5
-- opt.mouse = ""

-- Disable the check order
vim.g.lazyvim_check_order = false
