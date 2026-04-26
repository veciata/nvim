-- Personal Neovim configuration

-- Leader and localleader
vim.g.mapleader = " "
vim.g.localleader = " "

-- Load core modules and plugins
require("core")
require("plugins")

-- Colorscheme (natively, no plugin needed)
vim.cmd.colorscheme("tokyonight")

-- Enable LSP servers
vim.lsp.enable({ 'lua_ls', 'copilot', 'dartls', 'intelephense', 'ts_ls', 'blade_lsp' })

-- require("vim._core.ui2").enable()
