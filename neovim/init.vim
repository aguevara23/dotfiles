call plug#begin('$HOME/.config/nvim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'bilalq/lite-dfm'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'fatih/vim-go'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'                           " Linter

Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile' }
Plug 'alexlafroscia/coc-prettier', { 'branch': 'support-handlebars-prettier', 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-stylelint', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-tailwindcss', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'

Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'kana/vim-textobj-user'
Plug 'vimwiki/vimwiki'

Plug 'christoomey/vim-tmux-navigator'


" How do I get these to work?
Plug 'mattly/iterm-colors-pencil'
Plug 'reedes/vim-colors-pencil'

" Language Support {{{3
" JavaScript {{{4
Plug 'pangloss/vim-javascript'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'mxw/vim-jsx'
Plug 'neovim/node-host', { 'do': 'npm install' }

" TypeScript {{{4
" Plug 'HerringtonDarkholme/yats.vim' "need to figure out how to use this
Plug 'leafgarland/typescript-vim'

" HTML {{{4
Plug 'othree/html5.vim'

" CSS {{{4
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" Sass {{{4
Plug 'cakebaker/scss-syntax.vim'

" Python {{{4
Plug 'klen/python-mode', { 'for': 'python' }

Plug 'ryanoasis/vim-devicons'

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
set nocompatible
filetype plugin indent on
syntax on

noremap <Space> <Nop>
let mapleader = " "

colorscheme codedark
"
" For FZF-Vim
set rtp+=/usr/local/opt/fzf

set encoding=utf8
set shell=zsh
set hidden
set autoread
set relativenumber
set numberwidth=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set expandtab

set spellsuggest=15
set linebreak
set scrolloff=3
set foldcolumn=1

set updatetime=1000

set ts=2 sts=2 sw=2 et

set suffixesadd+=.js

set splitbelow
set splitright

" allows escape to switch modes faster
set timeoutlen=1000 ttimeoutlen=0

" COC Vim =====================

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" End COC vim ==============================


" Ale ================
let g:ale_linters = {
\   'typescript': ['eslint', 'tsserver', 'tslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
"  END Ale =============
hi StatusLine ctermbg=234 cterm=NONE

let g:goyo_width = 75
let g:goyo_linenr = 0

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap \ ,
noremap <Space> <Nop>

" Fix for Ctrl+Space sending NUL
map <NUL> <PageUp>

" See https://jennifermack.net/2017/02/01/recreating-ulysses-with-vim/
map <leader><leader>s :setlocal spell<cr>
map <F1> [s
map <F2> z=
map <F3> ]s
map <F4> zg
map <F5> zG

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map <leader>f :FZF<CR>
map <leader>r :Rg<CR>
map <leader>m :Marks<CR>
map <leader>/ :BLines<cr>|
map <leader>c :Commands<cr>|

autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!

nnoremap <leader>z :LiteDFMToggle<CR>
nnoremap <leader><leader>g :Goyo<CR>

" Vim Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gb :Git blame<CR>

" let g:dfm_fg_line = 101
" let g:dfm_bg = 103
" execute 'highlight LineNr ctermfg='        . g:dfm_fg_line
" execute 'highlight CursorLineNr ctermbg='  . g:dfm_bg

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>q :q<CR>
map <leader>s :w<CR>
map <leader>tt :vnew term://zsh<CR>
map <leader>y "*

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K
map <leader>ts <C-w>R
" set fillchars+=vert:\ "How do I get this to work?

" Vifm
map <leader>vv :Vifm<CR>

" Easier Buffer navigation
map <leader>; :Buffers<CR>

" Move between open buffers. TODD: find new keybindings for this
" nmap <C-]> :bnext<CR>
" nmap <C-[> :bprev<CR>

" Use the space key to toggle folds
nnoremap <leader>, za
vnoremap <leader>, zf

" Remap the increment and decrement features of Vim
nnoremap <A-a> <C-a>
"what does this do?
nnoremap å <C-a> "what does this do?

nnoremap <A-x> <C-x>
"what does this do?
nnoremap ≈ <C-x

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap ts :tab split<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>
nnoremap m1 1gt
nnoremap m2 2gt
nnoremap m3 3gt
nnoremap m4 4gt
nnoremap m5 5gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `

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

" Auto resize focused verticle split
" let &winwidth = &columns * 7 / 10

function! SetupMarkdown()
  exec ':colorscheme pencil'
  exec ':set background=light'
  exec ':set fcs=eob:\ '
endfunction

function! ClearMarks()
  exec ':delm! | delm A-Z0-9'
endfunction

" ================ LINT TEST?
if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost * " {{{2
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif "}}}2

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md call SetupMarkdown()

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  au BufRead,BufNewFile *.scss set filetype=scss.css

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig
endif

"==== PENCIL === NOTE: this seems to break markdown functionality?
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END

"====== Vim Wiki =========
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Advanced ripgrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" let g:terminal_color_0  = '#2e3436'
" let g:terminal_color_1  = '#cc0000'
" let g:terminal_color_2  = '#4e9a06'
" let g:terminal_color_3  = '#c4a000'
" let g:terminal_color_4  = '#3465a4'
" let g:terminal_color_5  = '#75507b'
" let g:terminal_color_6  = '#0b939b'
" let g:terminal_color_7  = '#d3d7cf'
" let g:terminal_color_8  = '#555753'
" let g:terminal_color_9  = '#ef2929'
" let g:terminal_color_10 = '#8ae234'
" let g:terminal_color_11 = '#fce94f'
" let g:terminal_color_12 = '#729fcf'
" let g:terminal_color_13 = '#ad7fa8'
" let g:terminal_color_14 = '#00f5e9'
" let g:terminal_color_15 = '#eeeeec'
