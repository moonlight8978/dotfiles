--- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/8b9363d83b5d779813cdd2819b8308651cec2a09/lua/mason-nvim-dap/mappings/adapters/init.lua
--- Lazily map debug adapters

local M = {}

local META = {}
function META.__index(table, key)
	local ok, adapter = pcall(require, 'config.dap.' .. key .. '.adapter')
	if not ok then
		return nil
	end
	table[key] = adapter
	return adapter
end

setmetatable(M, META)

return M
