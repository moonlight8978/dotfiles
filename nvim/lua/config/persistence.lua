local set = vim.keymap.set

require("persistence").setup({})

-- r stands for reload
set("n", "<leader>rs", function()
	require("persistence").load()
	vim.cmd(":Neotree")
end)
set("n", "<leader>rl", function()
	require("persistence").load({ last = true })
	vim.cmd(":Neotree")
end)

-- Close Neotree when Persist
vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceSavePre",
	callback = function()
		vim.cmd(":Neotree close")
	end,
})
