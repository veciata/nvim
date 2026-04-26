vim.pack.add({
	"https://github.com/adalessa/laravel.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/kevinhwang91/promise-async",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/Bleksak/laravel-ide-helper.nvim",
	-- "https://github.com/ricardoramirezr/blade-nav.nvim", -- Disabled due to errors
})

-- Setup Laravel
local ok, laravel = pcall(require, "laravel")
if ok then
	laravel.setup({
		lsp_server = "intelephense",
		features = {
			route_info = {
				enable = false, -- Disable for now to avoid errors
			},
			model_info = {
				enable = true,
			},
			override = {
				enable = true,
			},
			pickers = {
				enable = true,
				provider = "telescope",
			},
		},
	})
	vim.g.Laravel = laravel
end

-- Setup blade-nav (disabled due to errors)
-- pcall(function()
-- 	require("blade-nav").setup()
-- end)

-- Register Laravel keymaps with which-key
local wk = require("which-key")
wk.add({
	{ "<leader>l", group = "Laravel" },
	{ "<leader>ll", function() return Laravel and Laravel.pickers.laravel() end, desc = "Open Laravel Picker" },
	{ "<leader>la", function() return Laravel and Laravel.pickers.artisan() end, desc = "Open Artisan Picker" },
	{ "<leader>lr", function() return Laravel and Laravel.pickers.routes() end, desc = "Open Routes Picker" },
	{ "<leader>lm", function() return Laravel and Laravel.pickers.make() end, desc = "Open Make Picker" },
	{ "<leader>lc", function() return Laravel and Laravel.pickers.commands() end, desc = "Open Commands Picker" },
	{ "<leader>lo", function() return Laravel and Laravel.pickers.resources() end, desc = "Open Resources Picker" },
	{ "<leader>lt", function() return Laravel and Laravel.commands.run("actions") end, desc = "Open Actions Picker" },
	{ "<leader>lu", function() return Laravel and Laravel.commands.run("hub") end, desc = "Artisan hub" },
	{ "<leader>lh", function() return Laravel and Laravel.run("artisan docs") end, desc = "Open Documentation" },
	{ "<c-g>", function() return Laravel and Laravel.commands.run("view:finder") end, desc = "Open View Finder" },
	{ "<leader>lp", function() return Laravel and Laravel.commands.run("command_center") end, desc = "Open Command Center" },
	{ "<leader>Lm", function() require("laravel-ide-helper").generate_models(vim.fn.expand("%")) end, desc = "Generate Model Info for current model" },
	{ "<leader>LM", function() require("laravel-ide-helper").generate_models() end, desc = "Generate Model Info for all models" },
})
