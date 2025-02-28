local set = vim.keymap.set
-- local auto_cmd = vim.api.nvim_create_autocmd

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
	filesystem = {
		hijack_netrw_behavior = "open_current",
		filtered_items = {
			hide_gitignored = false,
			hide_dotfiles = false,
			hide_by_name = {
				-- Mac
				".DS_Store",
				-- NodeJS
				"node_modules",
				-- Build, log, misc...
				"build",
				"dist",
				"log",
				-- Git
				".git",
        -- Python
        "__pycache__",
			},
		},
	},
})
-- reveal file in explorer
set("n", "<leader>\\", function()
	require("neo-tree.command").execute({
		action = "focus",
	})
end)

-- toggle explorer, like vscode
set("n", "<C-\\>", ":Neotree toggle<CR>")

-- reveal current buffer in explorer
set("n", "\\", ":Neotree reveal<CR>")

--- open on startup
-- auto_cmd("VimEnter", {
-- 	callback = function()
-- 		vim.cmd("Neotree")
-- 		vim.cmd("wincmd p")
-- 	end,
-- })
