return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- Blade template support for Vim
  { "jwalton512/vim-blade" },
  -- Treesitter support for various languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  -- Laravel support
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    opts = {},
    config = true,
  },
  {
    "Bleksak/laravel-ide-helper.nvim",
    opts = {
      save_before_write = true,
      format_after_gen = true,
      models_args = {},
    },
    enabled = function()
      return vim.fn.filereadable("artisan") ~= 0
    end,
    keys = {
      {
        "<leader>lgm",
        function()
          require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
        end,
        desc = "Generate Model Info for current model",
      },
      {
        "<leader>lgM",
        function()
          require("laravel-ide-helper").generate_models()
        end,
        desc = "Generate Model Info for all models",
      },
    },
  },
}
