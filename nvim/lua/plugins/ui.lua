return {{
    "chriskempson/base16-vim",
    config = function()
        vim.cmd [[colorscheme base16-chalk]]
    end
}, {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {}
}, {
    'akinsho/bufferline.nvim',
    opts = {
        options = {
            separator_style = "slope"
        }
    },
    dependencies = 'nvim-tree/nvim-web-devicons'
}, -- Status bar
{
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require("config.lualine")
    end
}}
