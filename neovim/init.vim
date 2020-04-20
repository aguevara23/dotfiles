call plug#begin('$HOME/.config/nvim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'bilalq/lite-dfm'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'pangloss/vim-javascript'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'fatih/vim-go'
Plug 'tpope/vim-repeat'

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
colorscheme codedark
"
" For FZF-Vim
set rtp+=/usr/local/opt/fzf

set autoread
set relativenumber
set numberwidth=3

set spellsuggest=15
set linebreak
set scrolloff=3
set foldcolumn=1
set laststatus=2
set statusline=%=\ %{WordCount()}
set updatetime=1000

set ts=2 sts=2 sw=2 et

set suffixesadd+=.js

set splitbelow
set splitright

hi StatusLine ctermbg=234 cterm=NONE

let g:goyo_width = 75 
let g:goyo_linenr = 0

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap \ ,

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
map <C-f> :FZF<CR>
map <leader>f :FZF<CR>

autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!

let g:word_count="<unknown>"
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


nnoremap <Leader>z :LiteDFMToggle<CR>
nnoremap <Leader>g :Goyo<CR>
let g:dfm_fg_line = 101
let g:dfm_bg = 103
execute 'highlight LineNr ctermfg='        . g:dfm_fg_line 
execute 'highlight CursorLineNr ctermbg='  . g:dfm_bg 

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier Buffer navigation
nmap ; :Buffers<CR>

" Move between open buffers.
nmap <C-k> :bnext<CR>
nmap <C-j> :bprev<CR>

" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" General: Macro repeater {{{

" Allow '.' to repeat macros. Finally!
" Taken from here:
" https://vi.stackexchange.com/questions/11210/can-i-repeat-a-macro-with-the-dot-operator
" SR took it from GitHub: ckarnell/Antonys-macro-repeater
"
" When . repeats g@, repeat the last macro.
function! AtRepeat(_)
  " If no count is supplied use the one saved in s:atcount.
  " Otherwise save the new count in s:atcount, so it will be
  " applied to repeats.
  let s:atcount = v:count ? v:count : s:atcount
  " feedkeys() rather than :normal allows finishing in Insert
  " mode, should the macro do that. @@ is remapped, so 'opfunc'
  " will be correct, even if the macro changes it.
  call feedkeys(s:atcount.'@@')
endfunction

function! AtSetRepeat(_)
  set operatorfunc=AtRepeat
endfunction

" Called by g@ being invoked directly for the first time. Sets
" 'opfunc' ready for repeats with . by calling AtSetRepeat().
function! AtInit()
  " Make sure setting 'opfunc' happens here, after initial playback
  " of the macro recording, in case 'opfunc' is set there.
  set operatorfunc=AtSetRepeat
  return 'g@l'
endfunction

" Enable calling a function within the mapping for @
nnoremap <expr> <plug>@init AtInit()
" A macro could, albeit unusually, end in Insert mode.
inoremap <expr> <plug>@init "\<c-o>".AtInit()

function! AtReg()
  let s:atcount = v:count1
  let l:c = nr2char(getchar())
  return '@'.l:c."\<plug>@init"
endfunction

function! QRepeat(_)
  call feedkeys('@'.s:qreg)
endfunction

function! QSetRepeat(_)
  set operatorfunc=QRepeat
endfunction

function! QStop()
  set operatorfunc=QSetRepeat
  return 'g@l'
endfunction

nnoremap <expr> <plug>qstop QStop()
inoremap <expr> <plug>qstop "\<c-o>".QStop()

let s:qrec = 0
function! QStart()
  if s:qrec == 1
    let s:qrec = 0
    return "q\<plug>qstop"
  endif
  let s:qreg = nr2char(getchar())
  if s:qreg =~# '[0-9a-zA-Z"]'
    let s:qrec = 1
  endif
  return 'q'.s:qreg
endfunction

" }}}

let &winwidth = &columns * 7 / 10

