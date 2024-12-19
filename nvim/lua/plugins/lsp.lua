return {
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- Snippets
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},
	{ "sbdchd/neoformat" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"javascript",
					"typescript",
					"tsx",
					"markdown",
					"markdown_inline",
					"ruby",
					"python",
					"dockerfile",
					"yaml",
					"json",
				},
				highlight = { enable = true },
				indent = { enable = true },
				matchup = {
					enable = true,
				},
			})
		end,
	},
}
