return {{
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",

    -- Snippets
                    "SirVer/ultisnips", "quangnguyen30192/cmp-nvim-ultisnips"},
    config = function()
        require("config.nvim-cmp")
    end
}, {
    "neovim/nvim-lspconfig",
    config = function()
        require("config.lsp")
        -- require("config.terraformls")
    end
}, {"neoclide/coc.nvim"}}
