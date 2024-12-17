vim.loader.enable()

local config_dir = vim.fn.stdpath("config")

require("globals")

require("config.lazy")

vim.cmd("source ".. vim.fs.joinpath(config_dir, "vimrc/options.vim"))
