return {
	{
		"folke/persistence.nvim",
		config = function()
			require("config.persistence")
		end,
		enabled = false,
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = false,
	},
}
