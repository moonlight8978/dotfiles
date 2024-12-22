local set = vim.keymap.set
local auto_cmd = vim.api.nvim_create_autocmd

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
auto_cmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree")
		vim.cmd("wincmd p")
	end,
})
