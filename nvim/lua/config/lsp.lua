local lspconfig = require("lspconfig")
local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
local schemastore = require("schemastore")
local set = vim.keymap.set

vim.keymap.set("", "<leader>f", function()
	require("conform").format({
		async = true,
	}, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
end, {
	desc = "Format code",
})

set("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "LSP code action",
})
set("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "varialbe rename",
})

local M = {}

function M.setup(opts)
	local servers = opts.servers

	servers.pyright = vim.tbl_deep_extend("force", servers.pyright or {}, {
		settings = {
			python = {
				analysis = {
					diagnosticMode = "workspace",
          typeCheckingMode = "off"
				},
			},
		},
	})

	servers.jsonls = vim.tbl_deep_extend("force", servers.jsonls or {}, {
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
				validate = {
					enable = true,
				},
			},
		},
	})

	servers.yamlls = vim.tbl_deep_extend("force", servers.yamlls or {}, {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
				schemas = schemastore.yaml.schemas(),
			},
		},
	})

	servers.lua_ls = vim.tbl_deep_extend("force", servers.lua_ls or {}, {
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
						vim.env.VIMRUNTIME, -- Depending on the usage, you might want to add additional paths here.
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

	for server, config in pairs(servers) do
		config.capabilities = default_capabilities

		lspconfig[server].setup(config)
	end
end

return M
