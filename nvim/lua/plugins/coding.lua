return {{"NoahTheDuke/vim-just"}, {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        file_types = {"markdown", "Avante"}
    },
    ft = {"markdown", "Avante"}
}, {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",

    -- Snippets
                    "SirVer/ultisnips", "quangnguyen30192/cmp-nvim-ultisnips"},
    config = function()
        require("config.nvim-cmp")
    end
}, {
    "williamboman/mason.nvim",
    opts = true
}, { --- LSP Installer
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { --- Terraform, HCL
        "terraformls", --- Shell
        "bashls", --- Typescript
        "vtsls", "graphql", --- Lua
        "lua_ls", --- python
        "ruff", "pyright", --- Golang
        "gopls", --- Miscs
        "jsonls", "yamlls"}
    },
    dependencies = {"williamboman/mason.nvim"}
}, {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "b0o/schemastore.nvim"},
    opts = {
        servers = {
            bashls = {},
            vtsls = {},
            graphql = {
                filetypes = {"graphql"}
            },
            terraformls = {
                filetypes = {"terraform", "hcl"}
            },
            html = {
                filetypes = {"html"}
            },
            jsonls = {},
            yamlls = {},
            ruff = {},
            pyright = {},
            lua_ls = {},
            gopls = {}
        }
    },
    config = function(_, opts)
        require("config.lsp").setup(opts)
    end
}, { --- Tools installer
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {"stylua", -- Javascript
        "prettier", "js-debug-adapter", --- Golang
        "gofumpt", -- Shell
        "shfmt", "codespell"}
    }
}, {
    "stevearc/conform.nvim",
    opts = {
        og_level = vim.log.levels.ERROR,
        formatters_by_ft = {
            lua = {"stylua"},

            javascript = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"},
            javascriptreact = {"prettier"},

            graphql = {"prettier"},

            html = {"prettier"},
            handlebars = {"prettier"},

            json = {"prettier"},
            jsonc = {"prettier"},
            yaml = {"prettier"},

            bash = {"shfmt"},
            sh = {"shfmt"},

            python = {"ruff_fix", "ruff_organize_imports", "ruff_format"},

            terraform = {"terraform_fmt"},
            hcl = {"terragrunt_hclfmt"},

            go = {"gofumports", "gofumpt"},

            ["*"] = {"codespell"},
            ["_"] = {"trim_whitespace"}
        }
    }
}, { --- Improve syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"lua", "vim", "bash", "javascript", "typescript", "tsx", "html", "css", "markdown",
                                "markdown_inline", "ruby", "python", "go", "dockerfile", "yaml", "json", "jsonc",
                                "graphql", "terraform", "hcl"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            matchup = {
                enable = true
            }
        })
    end
}, { --- Diagnostics
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {{
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)"
    }, -- {
    -- 	"<leader>xX",
    -- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    -- 	desc = "Buffer Diagnostics (Trouble)",
    -- },
    -- {
    -- 	"<leader>cs",
    -- 	"<cmd>Trouble symbols toggle focus=false<cr>",
    -- 	desc = "Symbols (Trouble)",
    -- },
    -- {
    -- 	"<leader>cl",
    -- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    -- 	desc = "LSP Definitions / references / ... (Trouble)",
    -- },
    -- {
    -- 	"<leader>xL",
    -- 	"<cmd>Trouble loclist toggle<cr>",
    -- 	desc = "Location List (Trouble)",
    -- },
    {
        "<leader>xp",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)"
    }}
}, {
    "windwp/nvim-ts-autotag",
    opts = true
}, {
    "numToStr/Comment.nvim",
    opts = {}
}, {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()

        -- Disable built-in diagnostic feedbacks
        vim.diagnostic.config({
            virtual_text = false
        })
    end
}, {
    "akinsho/git-conflict.nvim",
    version = "*",
    opts = {
        default_mappings = {
            ours = "o",
            theirs = "t",
            none = "0",
            both = "b",
            next = "n",
            prev = "p"
        }
    }
} --- AI code suggestion
-- {
-- 	"zbirenbaum/copilot.lua",
-- 	cmd = "Copilot",
-- 	event = "InsertEnter",
-- 	config = function()
-- 		require("config.copilot")
-- 	end,
-- },
-- {
--     "yetone/avante.nvim",
--     event = "VeryLazy",
--     version = "*",
--     build = "make",
--     dependencies = {"nvim-treesitter/nvim-treesitter", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim",
--                     "MunifTanjim/nui.nvim", "hrsh7th/nvim-cmp", "ibhagwan/fzf-lua", "nvim-tree/nvim-web-devicons",
--                     "zbirenbaum/copilot.lua", {
--         -- support for image pasting
--         "HakonHarnes/img-clip.nvim",
--         event = "VeryLazy",
--         opts = {
--             -- recommended settings
--             default = {
--                 embed_image_as_base64 = false,
--                 prompt_for_file_name = false,
--                 drag_and_drop = {
--                     insert_mode = true
--                 },
--                 -- required for Windows users
--                 use_absolute_path = true
--             }
--         }
--     }}
-- }
}
