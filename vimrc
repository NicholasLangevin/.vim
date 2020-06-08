"  __     _____ __  __ ____   ____
"  \ \   / /_ _|  \/  |  _ \ / ___|
"   \ \ / / | || |\/| | |_) | |
"    \ V /  | || |  | |  _ <| |___
"     \_/  |___|_|  |_|_| \_\\____|
"

" {{{ Plugins Manager

call plug#begin('~/.vim/plugged')

" ~~ Built-in plugin (i.e. tpope) ~~
Plug 'tpope/vim-fugitive'                           | " Illegal Git Wrapper
Plug 'tpope/vim-commentary'                         | " Comment Block
Plug 'tpope/vim-eunuch'                             | " Helpers for UNIX
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | " Fuzzy Files Finder
Plug 'junegunn/fzf.vim'                             | " fzf Wrapper for Vim

" ~~ Missing motion ~~
Plug 'rhysd/clever-f.vim'                           | " Motion Improvement
Plug 'justinmk/vim-sneak'

" ~~ Usefull plugins
Plug 'ap/vim-buftabline'                            | " Buffer View
Plug 'liuchengxu/vim-which-key'                     | " Build in cheatsheet
Plug 'vimwiki/vimwiki'

" ~~ Colorshemes ~~
Plug 'KeitaNakamura/neodark.vim'                    | " Neodark Theme
Plug 'arcticicestudio/nord-vim'                     | " Nord Theme
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'drewtempelmeyer/palenight.vim'

" ~~ Status line
Plug 'itchyny/lightline.vim'                        | " Status Bar

" ~~ Filetypes ~~
Plug 'dag/vim-fish'                                 | " Syntax for fish script

" ~~ Markdown ~~

" ~~ Terminal support ~~

" ~~ Git improvement ~~
Plug 'airblade/vim-gitgutter'                       | " Git Blame Myself
Plug 'samoshkin/vim-mergetool'                      | " Git Mergtool



Plug 'preservim/nerdtree'                           | " Files Managers
Plug 'benmills/vimux'                               | " REPL Programming
" Plug 'gu-fan/simpleterm.vim'
"
"
" TODO:
" Plug 'francoiscabrol/ranger.vim'                    | " Launch Ranger from vim
" Plug 'vim-scripts/AutoComplPop'                     | " Improve autocompletion
" Plug 'liuchengxu/vim-clap'
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'godlygeek/tabular'
" multiple-cursor
" Plug 'sindresorhus/github-markdown-css'
" Luke smith plugins for accent: vimling
" TODO: completion for function/methode only, use ctrl-n for buffer completion

call plug#end()
" }}}

" {{{ Settings
"   ____         _    _    _
"  / ___|   ___ | |_ | |_ (_) _ __    __ _
"  \___ \  / _ \| __|| __|| || '_ \  / _` |
"   ___) ||  __/| |_ | |_ | || | | || (_| |
"  |____/  \___| \__| \__||_||_| |_| \__, |
"                                    |___/

filetype plugin indent on

" {{{ Editor
set number          | " Show line number
set relativenumber  | " Set relative number
set noshowmode      | " Dont show the mode (insert, normal,..)
set ttimeoutlen=1   | " Key waiting time
set laststatus=2    | " Always displaying the status bar
" }}}
" {{{ Text
set colorcolumn=80            | " Line width indicator
set wrap                      | " Enable wrapping text
set showmatch                 | " Show matching bracket
" }}}
" {{{ Buffer
" set hidden | " Change buffer focus without saving
" }}}
" {{{ Windows
set splitbelow splitright     | " Split Windows as expected
" }}}
" {{{ Indentation
" Number of spaces that a <Tab> in the file counts for
set tabstop=4    | "Tabs are at proper location
set shiftwidth=4 | "Indent 4 space when using <tab>

set autoindent   | " Copy indent when starting new line
set smartindent  | " Smart autoindenting when starting new line
set smarttab     | " Indent according to 'shiftwidth' value
set expandtab    | " Proper indentation with '>' and '<'
set cindent      | " Use the C indenting rules
" }}}
" {{{ Search
set nohlsearch | "Don't Highlight matching pattern
set incsearch  | "Search as I type character
set ignorecase | " Insensitive mathching
set smartcase  | " Use smartcase only when needed
" }}}
" {{{ Mouse
set mouse=a | " Enable the use of the mouse
if !has('nvim')
    set ttymouse=sgr
endif
" }}}
" {{{ Vim Behavior
set nocompatible                  | " Vim behave in a more useful way
set clipboard=unnamed,unnamedplus | " Sync register with (*) and (+) clipboard
set spelllang=en_us,fr            | " Language setting
set foldmethod=marker             | " How to use fold in vim
set encoding=utf-8                | " Encoding
set autowrite                     | " Automatically save before commands like :next and :make
set backspace=indent,eol,start    | " Set backspace to act like normal
set complete-=i                   | " Set autocomplete to scan file and included file
set timeoutlen=500
" }}}

" }}}

" {{{ Colors
"⟦    ____      _
"   / ___|___ | | ___  _ __
"  | |   / _ \| |/ _ \| '__|
"  | |__| (_) | | (_) | |
"   \____\___/|_|\___/|_|
"

syntax enable
colorscheme neodark

" {{{ Setting true color
if !has('gui_running')
  set t_Co=256
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" }}}
" {{{ lightline
let g:lightline = {
      \ 'colorscheme': 'neodark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gitbranch', 'todo', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitbranch',
      \   'todo' : 'LightlineTodo'
      \ },
      \ }

function! LightlineTodo()
    " return '✓ 2 Todo'
    " return '☖ 2'
    " return '☕2'
    " ⍿
    return ''
endfunction

function! LightlineGitbranch()
	let l:bname = FugitiveHead()
    let l:gitbranch_icon = '⍿'
	return l:bname != '' ? l:gitbranch_icon . '' . l:bname : ''
endfunction
" }}}

" }}}

" {{{ Autocommands

"               _                           _
"    __ _ _   _| |_ ___   ___ _ __ ___   __| |
"   / _` | | | | __/ _ \ / __| '_ ` _ \ / _` |
"  | (_| | |_| | || (_) | (__| | | | | | (_| |
"   \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|

autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 1. highlight trailing whitespace in red
" 2. have this highlighting not appear while you are typing in insert mode
" 3. have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace guibg=#bd5353 ctermbg=131
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function CleanSave()
" Deletes all trailing whitespace and newlines at end of file.
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e   " Delete trailing whitespace
    %s/\n\+\%$//e " Delete newlines at end of file
    normal 'yz<CR>
    normal `z
  endif
endfunction
command! Wc call CleanSave()

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul

" ~~ Block & Line cursor ~~
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" }}}

" {{{ Mapping
"   __  __                   _
"  |  \/  | __ _ _ __  _ __ (_)_ __   __ _
"  | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` |
"  | |  | | (_| | |_) | |_) | | | | | (_| |
"  |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |
"               |_|   |_|            |___/

let mapleader = "\<space>"

" {{{ +Windows
"@def:delete
nnoremap <leader>wd <C-W>c
"@def:resize
nnoremap <leader>w= <C-W>='
"@def:fzf-split
nnoremap <leader>ws :call fzf#run({'down': '40%', 'sink': 'split' })<CR>
"@def:fzf-vsplit
nnoremap <leader>wv :call fzf#run({'down': '40%', 'sink': 'vsplit' })<CR>
nnoremap <leader>wh <C-W>h
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wl <C-W>l
nnoremap <leader>wo <C-W>o
nnoremap <leader>wH <C-W>5<'
nnoremap <leader>wJ :resize +5'
nnoremap <leader>wL <C-W>5>'
nnoremap <leader>wK :resize -5'
" TODO: https://github.com/dhruvasagar/vim-zoom

tnoremap <leader>ww <C-W>w
tnoremap <leader>wc <C-W>c
tnoremap <leader>wh <C-W>h
tnoremap <leader>wj <C-W>j
tnoremap <leader>wk <C-W>k
tnoremap <leader>wl <C-W>l
tnoremap <leader>wH <C-W>5<'
tnoremap <leader>wJ resize +5'
tnoremap <leader>wL <C-W>5>'
tnoremap <leader>wK resize -5'
" }}}
" {{{ +Buffers
nnoremap <silent> <leader><space> :Buffers<CR>

"@def:bprevious
nnoremap <silent> <leader>[ :bprevious<CR>
"@def:bnext
nnoremap <silent> <leader>] :bnext<CR>
"@def:bfirst
nnoremap <silent> <leader>{ :bfirst<CR>
"@def:blast
nnoremap <silent> <leader>} :blast<CR>
"@def:bdelete
nnoremap <silent> <leader>d :bd<CR>
" }}}
" {{{ +Files
"@def:open
nnoremap <leader>ff :Files<CR>
"@def:git-open
nnoremap <leader>fg :GFiles<CR>
"@def:rename
nnoremap <leader>fr :Rename<space>
"@def:delete
nnoremap <silent><leader>fd :if confirm('Delete file from system?', "&Yes\n&No", 1)==1 <Bar> exe ":Delete" <Bar> endif<CR><CR>
"@def:move
nnoremap <leader>fm :Move<space>
"@def:permission
map <leader>fp :echo system("ls -l " . bufname("%") . " \| egrep -o '[rwx-]{10}'")<CR>:Chmod<space>

" }}}
" {{{ +git
"@def:add
nnoremap <leader>ga :Git add %<CR>
"@def:status
nnoremap <leader>gs :Git status<CR>
"@def:commit
nnoremap <leader>gc :Git commit<CR>
" }}}
" {{{ Disable arrow keys
no  <down>  <Nop>
no  <left>  <Nop>
no  <right> <Nop>
no  <up>    <Nop>
ino <down>  <Nop>
ino <left>  <Nop>
ino <right> <Nop>
ino <up>    <Nop>
vno <down>  <Nop>
vno <left>  <Nop>
vno <right> <Nop>
vno <up>    <Nop>
" }}}
" {{{ Cursor moving
" ~~ Move cyrsor in command-line ~~
cnoremap <c-h> <left>
cnoremap <c-j> <s-left>
cnoremap <c-k> <s-right>
cnoremap <c-l> <right>

" ~~ Move cursor without exit insert mode ~~
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <up>
inoremap <C-j> <down>

" ~~ Visual line navigation ~~
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}

"Add line without go in insert mode"
nnoremap = o<esc>
nnoremap + O<esc>j

" Move a line of text using CTRL+[jk] in visual mode
vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Weird mapping for my french mac keyboard when using US mapping
nnoremap § `
inoremap § `
inoremap ± ~

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>, :edit $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" }}}

" {{{ Private Configuration
" TODO: autoload function
source ~/.vim/conf/functions.vim  | " Private function
" }}}

"TODO:

" Real Delete (no save in register)
" nnoremap <leader>dd "_d

" While in insert mode, delete the last line (like <C-W>)
" inoremap <C-l> <esc>d(

" Nice mapping
nnoremap <tab> %
nnoremap H ^
nnoremap L $
