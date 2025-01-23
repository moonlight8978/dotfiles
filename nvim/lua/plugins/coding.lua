return {
  -- fast comment code generator
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},

  -- github copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("config.copilot")
		end,
	},

	-- auto close tag with treesitter
	{ "windwp/nvim-ts-autotag", opts = true },
}
