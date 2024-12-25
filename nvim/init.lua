vim.loader.enable()

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local config_dir = vim.fn.stdpath("config")
vim.cmd("source " .. vim.fs.joinpath(config_dir, "vimrc/options.vim"))
vim.cmd("source " .. vim.fs.joinpath(config_dir, "vimrc/plugins.vim"))

require("core.globals")
require("core.keymap")
require("core.filetype")

require("config.lazy")
