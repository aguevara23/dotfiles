set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set nohls

set encoding=utf8
set shell=zsh
set autoindent
set hidden
set numberwidth=10
set wrap
set linebreak
set splitbelow
set splitright

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

lua require('mason').setup()
lua require('fzf-lua').setup({'telescope'})
lua require('lspconfig').gopls.setup{}
" lua require('lspconfig').tailwindcss-language-server.setup{}
lua require('lspconfig').sorbet.setup{}

set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

" Remaps
let mapleader = " "
noremap <Space> <Nop>
nnoremap <leader>pv : Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
vnoremap <leader>p "_dP
vnoremap <leader>y "*y
nnoremap <leader>y "*y
nnoremap <leader>Y gg"*yG
nnoremap <leader>x :!chmod +x %<CR>

nnoremap <C-p> :FzfLua git_files<CR>
nnoremap <leader>f :FzfLua files<CR>
nnoremap <leader>g :FzfLua grep<CR>
nnoremap <leader>; :FzfLua buffers<CR>
nnoremap <leader>a :FzfLua grep_cword<CR>
nnoremap <leader>v :FzfLua grep_visual<CR>
nnoremap <leader>r :FzfLua grep_project<CR>
nnoremap <leader>l :FzfLua lines<CR>
nnoremap <leader>/ :FzfLua blines<CR>
nnoremap <leader>. :FzfLua quickfix<CR>
nnoremap <leader>m :FzfLua marks<CR>
nnoremap <leader>c :FzfLua commands<CR>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

map <leader>q :q<CR>
map <leader>s :w<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Vim Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Git difftool<CR>
map <leader>gy :GBrowse<CR>

" TODO: Fix this. Need to figure out how to run tmux-sessionizer from anywhere
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" Functions
fun! Scratch(cmd)
    new
    setlocal nobuflisted buftype=nofile bufhidden=delete

    let output = systemlist(a:cmd)
    call append(0, l:output)
endfun

let w:ProseModeOn = 0

function EnableProseMode()
	setlocal spell spelllang=en_us
	Goyo 66
	SoftPencil
	echo "Prose Mode On"
endfu

function DisableProseMode()
	Goyo!
	NoPencil
	setlocal nospell
	echo "Prose Mode Off"
endfu

function ToggleProseMode()
	if w:ProseModeOn == 0
		call EnableProseMode()
		let w:ProseModeOn = 1
	else
		call DisableProseMode()
	endif
endfu

command Prose call EnableProseMode()
command UnProse call DisableProseMode()
command ToggleProse call ToggleProseMode()

" function Scratch()
" 	setlocal buftype=nofile
" 	setlocal bufhidden=hide
" 	setlocal noswapfile
" endfu

" nnoremap <Leader>d :new \| read ! sdcv <C-R><C-W> <CR>:call Scratch() <CR>:normal gg<CR>
" nnoremap <Leader>t :new \| read ! moby <C-R><C-W> \| tr , '\n' <CR>:call Scratch() <CR>:normal gg2dd <CR>
