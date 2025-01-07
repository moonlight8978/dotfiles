--- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/8b9363d83b5d779813cdd2819b8308651cec2a09/lua/mason-nvim-dap/mappings/adapters/init.lua
--- Lazily map debug adapters

local M = {}

local META = {}
function META.__index(table, key)
	local ok, configuration = pcall(require, 'config.dap.' .. key .. '.configuration')
	if not ok then
		return nil
	end
	table[key] = configuration
	return configuration
end

setmetatable(M, META)

return M
