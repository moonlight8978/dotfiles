require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		--- Terraform, HCL
		"terraformls",

		--- Shell
		"bashls",

		--- Typescript
		"vtsls",
		"graphql",

		--- HTML
		"htmx",
		"html",
		"glint",

		--- Lua
		"lua_ls",

		--- python
		"pyright",

		"jsonls",
		"yamlls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- Lua
		"stylua",

		-- Javascript
		"prettier",
		"js-debug-adapter",

    --- Python
    "yapf",

		-- Shell
		"shfmt",
	},
})

require("mason-nvim-dap").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",

		"bash",

		"javascript",
		"typescript",
		"tsx",

		--- HTML, HBS (Glimmer)
		"html",
		"css",
		"glimmer",

		"markdown",
		"markdown_inline",

		"ruby",

		"python",

		"dockerfile",

		"yaml",
		"json",

		"graphql",

		--- Terraform, HCL
		"terraform",
		"hcl",
	},
	highlight = { enable = true },
	indent = { enable = true },
	matchup = {
		enable = true,
	},
})
