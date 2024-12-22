return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require("config.base16-nvim")
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
		opts = true,
	},
	{
		"echasnovski/mini.animate",
		opts = {},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"andymass/vim-matchup",
		config = function()
			require("config.vim-matchup")
		end,
	},
}
