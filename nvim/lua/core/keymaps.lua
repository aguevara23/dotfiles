vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.encoding = 'utf-8'
vim.opt.shell = 'zsh'
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.numberwidth = 10
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR>')
vim.keymap.set('n', '<c-j>', ':cnext<CR>')
vim.keymap.set('n', '<c-k>', ':cprev<CR>')

vim.keymap.set('n', '<c-down>', '<c-w><c-j>')
vim.keymap.set('n', '<c-up>', '<c-w><c-k>')
vim.keymap.set('n', '<c-right>', '<c-w><c-l>')
vim.keymap.set('n', '<c-left>', '<c-w><c-h>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
