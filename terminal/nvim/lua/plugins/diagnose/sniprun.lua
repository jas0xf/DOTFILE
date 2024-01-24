-- live execute snippet code

return {
  "michaelb/sniprun",
  dependencies = {
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  build = "sh install.sh",

  config = function()
    require("sniprun").setup({
      display = {
    -- "Classic",                    --# display results in the command-line  area
    --"VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
    "NvimNotify",              --# display with the nvim-notify plugin

    -- "VirtualText",             --# display results as virtual text
    -- "TempFloatingWindow",      --# display results in a floating window
    -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
    -- "Terminal",                --# display results in a vertical split
    -- "TerminalWithCode",        --# display results and code history in a vertical split
    -- "NvimNotify",              --# display with the nvim-notify plugin
    -- "Api"                      --# return output to a programming interface
  },
    --# customize highlight groups (setting this overrides colorscheme)
    snipruncolors = {
      SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
      SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
      SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
      SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
    },
    -- live_mode_toggle='enable',
    live_mode_toggle='false',
    })

    vim.api.nvim_set_keymap('v', 'r', ":SnipRun<cr>", {silent = true})
  end,
}
