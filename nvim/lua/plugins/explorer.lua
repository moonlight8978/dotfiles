local set = vim.keymap.set

-- jump between windows
set("n", "<leader>h", "<C-w>h")
set("n", "<leader>l", "<C-w>l")
set("n", "<leader>j", "<C-w>j")
set("n", "<leader>k", "<C-w>k")

return {{
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false
            }
        }
    },
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"},
    config = function()
        -- reveal file in explorer
        set("n", "<leader>\\", function()
            require("neo-tree.command").execute({
                action = "focus"
            })
        end)
        -- toggle explorer
        set("n", "<C-\\>", ":Neotree<CR>")
    end
}}
