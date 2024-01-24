-- a universal fuzzy finder with great ui (file, keymaps, highlightgroups...)

return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = { 
    'nvim-lua/plenary.nvim' 
  },
  config = function()
    telescope = require("telescope")
    telescope.setup({
      defaults = {
        initial_mode = "normal",
        mappings = {
          n = {
            ["<cr>"] = "select_tab",
          }
        }
      },
    })
    
    vim.cmd[[
      " highlight TelescopeNormal guibg=NONE
      " highlight TelescopeBorder guifg=#3ddbd9 guibg=NONE
      "
      " highlight TelescopePromptBorder guifg=#3ddbd9 guibg=NONE
      " highlight TelescopePromptNormal guibg=NONE
    ]]
  end,
}
