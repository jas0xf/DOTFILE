-- tabline

return {
    'tomiis4/BufferTabs.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
    },
    event = "VeryLazy",
    config = function()
      require('buffertabs').setup({
          -- config
          -- ---@type string use hl Group or hex color
        -- hl_group = 'BufferTabsActive',

        ---@type string use hl Group or hex color
        -- hl_group_inactive = 'Comment',
      })

      vim.cmd("set showtabline=0")
      
      -- diable first
      require("buffertabs").toggle()
      
      function ToggleAndTabNext()
          require("buffertabs").toggle()
          vim.cmd('tabnext')

          vim.defer_fn(function()
            require("buffertabs").toggle()
          end, 800)
      end

      vim.api.nvim_set_keymap('n', '<leader><Tab>', [[<Cmd>lua ToggleAndTabNext()<CR>]], { noremap = true, silent = true })

      vim.api.nvim_set_keymap('n', '<leader>q', [[<Cmd>bd<CR>]], { noremap = true, silent = true })


      function showTab() 
        require("buffertabs").toggle()

        vim.defer_fn(function()
          require("buffertabs").toggle()
        end, 800)
      end

      vim.api.nvim_exec([[
        autocmd TabNew * lua showTab()
      ]], false)

      vim.cmd[[
        
      ]]

    end

}
