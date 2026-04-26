---
--- Blade template language server.
---
--- https://github.com/gcavanunez/blade-lsp
---
--- Install via npm: npm install -g blade-lsp
---

---@type vim.lsp.Config
return {
    cmd = { 'blade-lsp', '--stdio' },
    filetypes = { 'blade' },
    root_markers = { 'composer.json', 'artisan', '.git' },
    settings = {},
}
