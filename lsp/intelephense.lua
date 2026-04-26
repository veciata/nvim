---@brief
---
--- PHP Intelephense language server.
---
--- https://github.com/bmewburn/vscode-intelephense
---

---@type vim.lsp.Config
return {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    settings = {
        intelephense = {
            files = { maxSize = 5000000 },
            format = { enable = true },
        },
    },
}
