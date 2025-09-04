return {
  {
    "2giosangmitom/nightfall.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- Add custom configuration here
    config = function(_, opts)
      require("nightfall").setup(opts)
      vim.cmd("colorscheme nightfall") -- Choose from: nightfall, deeper-night, maron, nord
    end,
  },

  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-paper",
    },
  },
}
