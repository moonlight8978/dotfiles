return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require("base16-colorscheme").with_config({})

			vim.cmd([[colorscheme base16-chalk]])
		end,
	},
	{
		"mawkler/modicator.nvim",
		dependencies = "RRethy/base16-nvim",
		init = function()
			-- These are required for Modicator to work
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		opts = {
			show_warnings = true,
		},
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
		enabled = false,
		opts = {},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"andymass/vim-matchup",
		config = function()
			-- TODO: Configure before plugin load
			require("config.vim-matchup")
		end,
	},
}
