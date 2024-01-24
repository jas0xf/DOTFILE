-- faster jk motion when holding

return {
  "rainbowhxch/accelerated-jk.nvim",
  event = "VeryLazy",
  config = function()
    require('accelerated-jk').setup()
    vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
  end,
}
