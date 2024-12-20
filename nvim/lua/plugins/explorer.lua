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
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_gitignored = true,
						hide_dotfiles = false,
					},
				},
			})
			-- reveal file in explorer
			set("n", "<leader>\\", function()
				require("neo-tree.command").execute({
					action = "focus",
				})
			end)

			-- toggle explorer
			set("n", "<C-\\>", ":Neotree toggle<CR>")

			-- reveal current buffer in explorer
			set("n", "\\", ":Neotree reveal<CR>")

			--- open on startup
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					vim.cmd("Neotree")
					vim.cmd("wincmd p")
				end,
			})
		end,
	},

	-- quick finder
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			set("n", "<leader>ff", ":FzfLua files<CR>")
			set("n", "<leader>fb", ":FzfLua buffers<CR>")
		end,
	},
}
