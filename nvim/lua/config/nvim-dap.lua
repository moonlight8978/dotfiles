local dap = require("dap")
local dapui = require("dapui")
local dap_adapters = require("config.dap.adapters")
-- local dap_configurations = require("config.dap.configurations")
local set = vim.keymap.set

require("mason-nvim-dap").setup({})

--- Configure adapters
local function load_dap(lang)
	dap.adapters[lang] = dap_adapters[lang].options
	-- for _, ft in ipairs(dap_adapters[lang].ft) do
	--   dap.configurations[ft] = dap_configurations[lang]
	-- end
end

load_dap("pwa-node")

--- Keymap
set("n", "<space>c", dap.continue) -- continue
set("n", "<space>t", dap.terminate) -- terminate
set("n", "<space>n", ":DapNew<CR>") -- new
set("n", "<space>b", dap.toggle_breakpoint) -- breakpoint
set("n", "<space>i", dap.step_into) -- into
set("n", "<space>s", dap.step_over) -- skip
set("n", "<space>o", dap.step_out) -- out

--- DAP UI
dapui.setup({})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
