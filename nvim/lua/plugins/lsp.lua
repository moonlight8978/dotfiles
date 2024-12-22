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
			require("config.nvim-lspconfig")
		end,
	},
	{ "sbdchd/neoformat" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.nvim-treesitter")
		end,
		dependencies = {
			"andymass/vim-matchup",
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>xX",
			-- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			-- 	desc = "Buffer Diagnostics (Trouble)",
			-- },
			-- {
			-- 	"<leader>cs",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			-- {
			-- 	"<leader>cl",
			-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			-- 	desc = "LSP Definitions / references / ... (Trouble)",
			-- },
			-- {
			-- 	"<leader>xL",
			-- 	"<cmd>Trouble loclist toggle<cr>",
			-- 	desc = "Location List (Trouble)",
			-- },
			{
				"<leader>xp",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	-- show LSP diagnostics, feedbacks as separate lines
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		opts = true,
	},
}
