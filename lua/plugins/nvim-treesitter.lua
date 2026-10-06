return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require("nvim-treesitter").install({
      "python",
      "c",
      "cpp",
      "cuda",
    })
  end,
  lazy = false,
  build = ':TSUpdate'
}
