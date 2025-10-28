local api = vim.api
local fn = vim.fn

local utils = require("utils")

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac = utils.has("macunix") and true or false

vim.g.logging_level = "info"

vim.opt.termguicolors = true

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

if utils.executable("python3") then
	if vim.g.is_win then
		vim.g.python3_host_prog = fn.substitute(fn.exepath("python3"), ".exe$", "", "g")
	else
		vim.g.python3_host_prog = fn.exepath("python3")
	end
else
	api.nvim_err_writeln("Python3 executable not found! You must install Python3 and set its PATH correctly!")
	return
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- -- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = "l"

-- Use English as main language
vim.cmd([[language en_US.UTF-8]])

-- -- Disable loading certain plugins

-- -- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_liststyle = 3
-- if vim.g.is_win then
--   vim.g.netrw_http_cmd = "curl --ssl-no-revoke -Lo"
-- end

-- -- Do not load tohtml.vim
-- vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
-- related to checking files inside compressed files)
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- -- Disable sql omni completion, it is broken.
-- vim.g.loaded_sql_completion = 1

-- Script encoding
vim.scriptencoding = "utf-8"

-- Turn on line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Disable swapfile
vim.opt.swapfile = false

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Word break and show break indicator
vim.opt.linebreak = true
vim.opt.showbreak = "↪"

-- Always show 5 lines when scrolling off screen
vim.opt.scrolloff = 5

-- Use built-in filetype plugin
vim.cmd("filetype plugin indent on")

-- Clipboard settings
if vim.fn.has("clipboard") == 1 then -- Check if clipboard is available
	vim.opt.clipboard:append("unnamedplus")
end

-- Set matching pairs
vim.opt.matchpairs:append("<:>,「:」,『:』,【:】,“:”,‘:’,《:》")

-- Case sensitivity settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- File encoding settings
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }

-- Mouse settings
vim.opt.mousemodel = "popup"
vim.opt.mousescroll = "ver:1,hor:0"

-- Note: 'noshowmode' is commented out in the original, so I've left it out
-- You can uncomment and add it as:
-- vim.opt.showmode = false

-- Hide cmd line
vim.opt.cmdheight = 0

-- Cursor settings
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:block-blinkon100-Cursor2/lCursor2,r-cr:hor20,o:hor50"

api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		api.nvim_set_hl(0, "Cursor", {
			fg = "#e0e0e0",
			bg = "#e0e0e0",
		})
		api.nvim_set_hl(0, "Cursor2", {
			fg = "#ddb26f",
			bg = "#ddb26f",
		})
	end,
})
