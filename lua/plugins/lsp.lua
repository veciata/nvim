vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    filetypes = { 'c', 'h', 'cpp', 'hpp' },
})
vim.lsp.enable({ 'clangd' })

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
