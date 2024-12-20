return {
	{
		"RRethy/nvim-base16",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme base16-chalk]])
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = { "help", "git", "markdown", "snippets", "text", "gitconfig" },
				buftypes = { "terminal" },
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				separator_style = "slope",
			},
		},
		dependencies = "nvim-tree/nvim-web-devicons",
	}, -- Status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},
	{
		"echasnovski/mini.animate",
		opts = {},
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"andymass/vim-matchup",
		opts = {},
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
}
