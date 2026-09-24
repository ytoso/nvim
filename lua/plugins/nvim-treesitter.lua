return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require("nvim-treesitter").install({
      "python",
    })
  end,
  lazy = false,
  build = ':TSUpdate'
}
