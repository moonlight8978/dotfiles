local set = vim.keymap.set

-- jump between windows
set("n", "<leader>h", "<C-w>h")
set("n", "<leader>l", "<C-w>l")
set("n", "<leader>j", "<C-w>j")
set("n", "<leader>k", "<C-w>k")

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("config.neo-tree")
		end,
	},

	-- quick finder
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.fzf-lua")
		end,
	},
}
