local set = vim.keymap.set

return {
  {'akinsho/toggleterm.nvim', version = "*", config = function()
    require("toggleterm").setup()

    local Terminal  = require('toggleterm.terminal').Terminal

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    set("n", "<leader>ts", ":TermSelect<CR>")

    set("n", "<leader>t", function()
      local instance = Terminal:new({
        float_opts = {
          width = function()
            return math.floor(vim.o.columns * 0.6)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.5)
          end,
          winblend = 0, -- transparency 0-100
          highlights = {
            border = "Normal",
            background = "Normal",
          }
        },
        -- Terminal settings
        direction = 'float',
        shade_terminals = true,
        close_on_exit = true,
        shell = vim.o.shell,
      })
 
      instance:toggle()
   end)
  end}
}
