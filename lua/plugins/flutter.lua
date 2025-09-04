return {
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" }, -- Only load for Dart files
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", -- Debug Adapter Protocol
      "rcarriga/nvim-dap-ui", -- Debug UI
      "stevearc/dressing.nvim", -- Better UI for inputs
    },
    opts = function()
      -- Configure debugger
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "flutter",
        args = { "debug-adapter" },
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Flutter",
          dartSdkPath = os.getenv("HOME") .. "/flutter/bin/cache/dart-sdk/",
          flutterSdkPath = os.getenv("HOME") .. "/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
      }

      return {
        -- Flutter tools configuration
        flutter_path = "flutter", -- or full path like "/path/to/flutter"
        fvm = false, -- Set to true if using FVM
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = ">",
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabnew",
        },
        lsp = {
          color = {
            enabled = true,
            background = true,
            background_color = { r = 19, g = 17, b = 24 },
            foreground = false,
          },
          on_attach = function(client, bufnr)
            -- LSP keymaps
            local map = vim.keymap.set
            local opts = { buffer = bufnr }

            map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "gD", vim.lsp.buf.declaration, opts)
            map("n", "gi", vim.lsp.buf.implementation, opts)
            map("n", "K", vim.lsp.buf.hover, opts)
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)
            map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            map("n", "<leader>f", function()
              vim.lsp.buf.format({ async = true })
            end, opts)
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            dart = {
              analysisExcludedFolders = {
                vim.fn.expand("~/.pub-cache"),
                vim.fn.expand("~/flutter/packages"),
              },
              completeFunctionCalls = true,
              showTodos = true,
              enableSnippets = true,
              updateImportsOnRename = true,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("flutter-tools").setup(opts)

      -- Custom keymaps
      local map = vim.keymap.set
      map("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Run Flutter" })
      map("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Quit Flutter" })
      map("n", "<leader>frr", "<cmd>FlutterRestart<CR>", { desc = "Restart Flutter" })
      map("n", "<leader>fd", "<cmd>FlutterDevices<CR>", { desc = "List devices" })
      map("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", { desc = "Emulator manager" })
      map("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Toggle outline" })
      map("n", "<leader>fl", "<cmd>FlutterLog<CR>", { desc = "View logs" })
      map("n", "<leader>ft", "<cmd>FlutterDevTools<CR>", { desc = "Open DevTools" })
    end,
  },

  -- Treesitter for Dart syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "dart" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },

  -- Debug UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
      local map = vim.keymap.set
      map("n", "<leader>dui", require("dapui").toggle, { desc = "Toggle Debug UI" })
      map("n", "<leader>dbc", require("dap").continue, { desc = "Debug Continue" })
      map("n", "<leader>dbk", require("dap").terminate, { desc = "Debug Stop" })
    end,
  },

  -- Formatting on save
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
