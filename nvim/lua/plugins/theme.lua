return {
  { 
    "chriskempson/base16-vim",
    config = function()
      vim.cmd [[colorscheme base16-chalk]]
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}
