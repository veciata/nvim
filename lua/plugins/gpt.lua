return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("chatgpt").setup({
        api_key = os.getenv("OPENAI_API_KEY"),
      })
    end,
  },
}
