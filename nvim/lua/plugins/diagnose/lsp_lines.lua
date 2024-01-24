--beautiful diagnose lines

return {
  "ErichDonGubler/lsp_lines.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,

}
