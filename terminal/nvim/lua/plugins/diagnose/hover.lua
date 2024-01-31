-- info about current obj in hover window
-- hovering mouse on LSP/dictionary to switch

return {
    "lewis6991/hover.nvim",
    event = "VeryLazy",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = nil
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true
        }

        -- local hover_time = 500
        -- local hover_timer = nil
        -- local mouse_position = nil
        --
        -- vim.o.mousemoveevent = true
        --
        -- vim.keymap.set({ '', 'i' }, '<MouseMove>', function()
        --     if hover_timer then
        --         hover_timer:close()
        --     end
        --     hover_timer = vim.defer_fn(function()
        --         mouse_position = vim.fn.getmousepos()
        --         hover_timer = nil
        --         -- require('notify').notify(vim.inspect(mouse_position))
        --         require("hover").hover()
        --     end, hover_time)
        --     return '<MouseMove>'
        -- end, { expr = true })
      
      -- second mode
      local mouse_position = vim.fn.getmousepos()

      vim.keymap.set({'', 'i'}, '<LeftRelease>',function()
        local temp = vim.fn.getmousepos()
        if temp.line == mouse_position.line then
          require("hover").hover()
        else
            mouse_position = temp
        end
      end , { noremap = true, silent = true })

    end
}
