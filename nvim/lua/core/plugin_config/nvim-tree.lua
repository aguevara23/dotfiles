vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
sort_by = "case_sensitive",
view = {
  width = 50,
},
renderer = {
  group_empty = true,
},
filters = {
  dotfiles = true,
},
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

