-- center code with zen mode

return {
  "folke/zen-mode.nvim",
  event = "VimEnter",
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 1,
        width = function()
          local width = vim.fn.winwidth(0)
          if width < 120 then
            return 120
          else
            return .85 * width
          end
        end

      },
      plugins = {
        options = {
          laststatus = 3,
        }
      }

    })
    vim.cmd('highlight ZenBg guibg=#000000')

    vim.cmd('ZenMode')

    vim.cmd('cabbrev wq wqa')
    vim.cmd('cabbrev q qa')

  end
}
