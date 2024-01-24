return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter"},
  dependencies = {
    -- parser
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local hlchunk = require("hlchunk")

    hlchunk.setup({
      chunk = {
        style = {
          "#3ddbd9", 
          "#c21f30"
        }
      },
      blank = {
        enable = false, 
      },
      indent = {
        enable = false, 
      }
    })

  end,
}
