local api = vim.api

api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		api.nvim_set_hl(0, "Cursor", { fg = "#e0e0e0", bg = "#e0e0e0" })
		api.nvim_set_hl(0, "Cursor2", { fg = "#ddb26f", bg = "#ddb26f" })
	end,
})
