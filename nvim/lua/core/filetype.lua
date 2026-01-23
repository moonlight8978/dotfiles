vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

vim.filetype.add({
	extension = {
		thor = "ruby",
	},
})

vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
	},
	pattern = {
		[".*%.ya?ml%.gotmpl"] = "yaml",
	},
})
