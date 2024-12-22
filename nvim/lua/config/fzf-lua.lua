local set = vim.keymap.set

require("fzf-lua").setup({})

set("n", "<leader>ff", ":FzfLua files<CR>")
set("n", "<leader>fb", ":FzfLua buffers<CR>")
