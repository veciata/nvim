---@brief
---
--- Dart language server.
---
--- https://github.com/dart-lang/sdk/blob/main/pkg/analysis_server/tool/lsp_spec/README.md
---

---@type vim.lsp.Config
return {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_markers = { 'pubspec.yaml', '.git' },
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        outline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
    },
}
