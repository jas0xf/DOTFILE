-- see defination ...

return {
  'rmagatti/goto-preview',
  event = "VeryLazy",
  config = function()
    require('goto-preview').setup {}

    vim.cmd [[
      " nnoremap gd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      " nnoremap gD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
      nnoremap gr <cmd>lua require('goto-preview').goto_preview_references()<CR>
      " nnoremap gt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
      " nnoremap gi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
    ]]
  end
} 
