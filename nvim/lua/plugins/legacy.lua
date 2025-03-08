return {{
    "folke/persistence.nvim",
    config = function()
        require("config.persistence")
    end,
    enabled = false
}, {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = false
}, -- github copilot
{
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("config.copilot")
    end,
    enabled = false
}, {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("config.toggleterm")
    end,
    enabled = false
}}
