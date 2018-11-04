if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall | source $MYVIMRC
	     endif

call plug#begin('~/.vim/plugged')

"Install Seoul256"
Plug 'https://github.com/junegunn/seoul256.vim.git'
"Install onedark color scheme"
Plug 'https://github.com/joshdick/onedark.vim.git'
"Install syntastic"
Plug 'https://github.com/vim-syntastic/syntastic.git'
"Install vim-fountain"
Plug 'https://github.com/JenniferMack/fountain.vim.git'
"Install Goyo"
Plug 'https://github.com/junegunn/goyo.vim.git'
"Install Limelight"
Plug 'https://github.com/junegunn/limelight.vim.git'
"Install Nerdtree"
Plug 'https://github.com/scrooloose/nerdtree.git'
"Install Vimfugitive"
Plug 'https://github.com/tpope/vim-fugitive.git'
"Install Retro Groove color Scheme"
Plug 'https://github.com/morhetz/gruvbox.git'
"Install LiteDFM"
Plug 'https://github.com/bilalq/lite-dfm.git'
"Install FZF
Plug 'https://github.com/junegunn/fzf.vim.git'
"Install Vim Surround
Plug 'https://github.com/tpope/vim-surround.git'
"Install Panglosee Vim Javascript"
Plug 'https://github.com/pangloss/vim-javascript.git'
"Install Vim JSX"
Plug 'https://github.com/mxw/vim-jsx.git'
"Install Ale"
Plug 'https://github.com/w0rp/ale.git'
"Install Emmet Vim"
Plug 'https://github.com/mattn/emmet-vim.git'
"Install Closetag"
Plug 'https://github.com/docunext/closetag.vim.git'
"Install Ctrl P"
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

call plug#end()

" allows you to create customization files for different file types
filetype plugin on

let mapleader = ","

syntax on
function! s:patch_gruvbox_colors()
  hi StatusLine ctermbg=223 cterm=NONE
  highlight Normal ctermbg=223 
endfunction

autocmd! ColorScheme gruvbox call s:patch_gruvbox_colors()
let g:gruvbox_background=229

set relativenumber
set numberwidth=3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set spellsuggest=15
set linebreak
set scrolloff=3
set foldcolumn=1
set laststatus=2
set statusline=%=\ %{WordCount()}

set ts=2 sts=2 sw=2 et

hi StatusLine ctermbg=234 cterm=NONE

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:goyo_width = 75 
let g:goyo_linenr = 0

map j gj
map k gk
map <space> <PageDown>
" Fix for Ctrl+Space sending NUL
map <NUL> <PageUp>

map <leader>s :setlocal spell<cr>
map <F1> [s
map <F2> z=
map <F3> ]s
map <F4> zg
map <F5> zG

map <C-n> :NERDTreeToggle<CR>

autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!

let g:word_count="<unknown>"
set updatetime=1000
augroup WordCounter
  au!  CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

function! WordCount()
  return g:word_count
endfunction

function! UpdateWordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  let g:word_count = n
endfunction


" autocmd BufEnter *.txt colorscheme Tomorrow"
nnoremap <Leader>z :LiteDFMToggle<CR>
nnoremap <Leader>g :Goyo<CR>
let g:dfm_fg_line = 101
let g:dfm_bg = 103
execute 'highlight LineNr ctermfg='       . g:dfm_fg_line 
execute 'highlight CursorLineNr ctermbg='  . g:dfm_bg 


autocmd BufEnter * colorscheme onedark
" autocmd BufEnter *.txt colorscheme seoul256
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

