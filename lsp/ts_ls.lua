---@brief
---
--- TypeScript/JavaScript language server (ts_ls).
---
--- Handles JavaScript, TypeScript, React (JSX), and React (TSX).
---
--- https://github.com/typescript-language-server/typescript-language-server
---

---@type vim.lsp.Config
return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
    settings = {
        typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = { completeFunctionCalls = true },
        },
        javascript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = { completeFunctionCalls = true },
        },
    },
}
