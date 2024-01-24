-- smooth scroll

return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  config = function() 
    require('cinnamon').setup() 

    -- Start/end of file and line number movements:
    -- vim.keymap.set({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
    vim.keymap.set({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")

    -- Start/end of line:
    vim.keymap.set({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
    vim.keymap.set({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
    vim.keymap.set({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")

    -- Paragraph movements:
    vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
    vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

    -- Previous/next search result:
    vim.keymap.set('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
    vim.keymap.set('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
    vim.keymap.set('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
    vim.keymap.set('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
    vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
    vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")
    -- Up/down movements:
    -- vim.keymap.set({ 'n', 'x' }, 'k', "<Cmd>lua Scroll('k', 0, 1)<CR>")
    -- vim.keymap.set({ 'n', 'x' }, 'j', "<Cmd>lua Scroll('j', 0, 1)<CR>")
    vim.keymap.set({ 'n', 'x' }, '<Up>', "<Cmd>lua Scroll('k', 0, 1)<CR>")
    vim.keymap.set({ 'n', 'x' }, '<Down>', "<Cmd>lua Scroll('j', 0, 1)<CR>")

    -- Left/right movements:
    vim.keymap.set({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
    vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
    vim.keymap.set({ 'n', 'x' }, '<Left>', "<Cmd>lua Scroll('h', 0, 1)<CR>")
    vim.keymap.set({ 'n', 'x' }, '<Right>', "<Cmd>lua Scroll('l', 0, 1)<CR>")

    -- SCROLL_WHEEL_KEYMAPS:

    vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
    vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

    -- LSP_KEYMAPS:

    -- LSP go-to-definition:
    vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")

    -- LSP go-to-declaration:
    vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")

    vim.keymap.set('n', 'J', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")
    vim.keymap.set('n', 'K', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
  end
}
