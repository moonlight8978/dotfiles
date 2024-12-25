local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local set = vim.keymap.set

require("mason").setup()

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

		-- Shell
		"shfmt",
	},
})

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

vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
end, { desc = "Format code" })

set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })

require("conform").setup({
	log_level = vim.log.levels.ERROR,
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },

		graphql = { "prettier" },

		html = { "prettier" },
		handlebars = { "prettier" },

		json = { "prettier" },

		bash = { "shfmt" },
		sh = { "shfmt" },

		terraform = { "terraform_fmt" },
		hcl = { "terragrunt_hclfmt" },

		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},
})

lspconfig.bashls.setup({
	capabilities = capabilities,
})

lspconfig.vtsls.setup({
	capabilities = capabilities,
})

lspconfig.graphql.setup({
	capabilities = capabilities,
	filetypes = { "graphql" },
})

lspconfig.terraformls.setup({
	capabilities = capabilities,
	filetypes = { "terraform", "hcl" },
})

lspconfig.html.setup({
	capabilities = capabilities,
	filetypes = { "html" },
})

lspconfig.htmx.setup({
	capabilities = capabilities,
	filetypes = { "edge", "handlebars" },
})

lspconfig.glint.setup({
	capabilities = capabilities,
	filetypes = { "handlebars" },
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
