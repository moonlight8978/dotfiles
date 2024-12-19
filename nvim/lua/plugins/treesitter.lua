return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { 
          "lua",
          "vim",
          "javascript",
          "typescript",
          "tsx",
          "markdown",
          "markdown_inline",
          "ruby",
          "python",
          "dockerfile",
          "yaml",
          "json",
        },
        highlight = { enable = true },
        indent = { enable = true },
        matchup = {
          enable = true
        },
      }
    end,
  }
}
