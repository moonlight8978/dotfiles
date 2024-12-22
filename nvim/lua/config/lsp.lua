local lspconfig = require("lspconfig")
local utils = require("utils")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local set = vim.keymap.set


set("n", "<leader>f", ":Neoformat<CR>")
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })


if utils.executable("bash-language-server") then
	lspconfig.bashls.setup({
		capabilities = capabilities,
	})
end

if utils.executable("vtsls") then
	lspconfig.vtsls.setup({
		capabilities = capabilities,
	})
end

if utils.executable("graphql-lsp") then
  lspconfig.graphql.setup({
    capabilities = capabilities,
  })
end

if utils.executable("terraform-ls") then
	lspconfig.terraformls.setup({
		capabilities = capabilities,
	})
end

if utils.executable("lua-language-server") then
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
end
