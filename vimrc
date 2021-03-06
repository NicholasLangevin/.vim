"  __     _____ __  __ ____   ____
"  \ \   / /_ _|  \/  |  _ \ / ___|
"   \ \ / / | || |\/| | |_) | |
"    \ V /  | || |  | |  _ <| |___
"     \_/  |___|_|  |_|_| \_\\____|
"

" {{{ Settings

filetype plugin indent on
let mapleader = ","
let maplocalleader = "\\"
let g:profile = 'master' " Either 'master' or 'work'

" {{{ Optionnal plugins
if g:profile == 'master'
    packadd vim-fish
    packadd vim-scriptease
endif
" }}}
" {{{ Basic Settings
set nocompatible                  | " Do not try to be *vi* compatible
set clipboard=unnamed,unnamedplus | " Sync register with (*) and (+) clipboards
set spelllang=en_us,fr            | " Language setting
set foldmethod=marker             | " How to use fold in vim
set encoding=utf-8                | " Encoding
set autowrite                     | " Automatically save before commands like :next and :make
set backspace=indent,eol,start    | " Set backspace to act like normal
set ttimeoutlen=100               | " Set waiting terminal key codes(i.e. fast <esc>)
set timeoutlen=500                | " Set waiting time between vim keypress
set number                        | " Show line number
set relativenumber                | " Set relative number
set laststatus=2                  | " Always displaying the status bar
set noshowmode                    | " Dont show the mode (insert, normal,..)
set textwidth=80                  | " Set value for the autowrap (see formatoptions)
set formatoptions=cr              | " Auto-wrap comment (c), auto-insert commented on <Enter> press
let &showbreak = "🠞 "             | " Unicode of wrapped line indicator
set colorcolumn=80                | " Line width indicator TODO: autocmd line wrap in md, Rmd, tex, txt.., gitcommit
set wrap                          | " Enable wrapping text
set showmatch                     | " Show matching bracket
set hidden                        | " Change buffer focus without saving
set splitbelow splitright         | " Split Windows as expected
" }}}
" {{{ Indentation
set tabstop=4                     | " Tabs are at proper location
set shiftwidth=4                  | " Indent 4 space when using <tab>

set autoindent                    | " Copy indent when starting new line
set smartindent                   | " Smart autoindenting when starting new line
set smarttab                      | " Indent according to 'shiftwidth' value
set expandtab                     | " Insert spaces when using <Tab>
set cindent                       | " Use the C indenting rules
" }}}
" {{{ Search
set nohlsearch                    | " Don't Highlight matching pattern
set incsearch                     | " Search as I type character
set ignorecase                    | " Insensitive mathching
set smartcase                     | " Use smartcase only when using CAP
" }}}
" {{{ Mouse
set mouse=a                       | " Enable the use of the mouse
if !has('nvim')
    set ttymouse=sgr              | " Needed for Alacritty terminal
endif
" }}}
" {{{ GUI
function! SetGuiFontSize(size)
    exe "set guifont=Lucida_Console:h" . a:size
endfunction
command! -nargs=1 SetGuiFontSize call SetGuiFontSize(<f-args>)
if has("gui_running")
    set guifont=Lucida_Console:h12
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guitablabel=%t
    set guicursor=n-v-c:block-Cursor
    " set guicursor+=i:block-Cursor
    set guicursor+=i:ver25-Cursor/lCursor
    set guicursor+=a:blinkon0
endif
" }}} 

" }}}
" {{{ Colors

syntax enable
let g:gruvbox_italic = 0
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection = 0
set background=dark
colorscheme gruvbox

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
      \             [ 'gitbranch' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'todo', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'filename' : ' %f',
      \   'modified' : '[%M]'
      \ },
      \ 'component_type': {
      \   'filename' : 'raw'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitbranch',
      \   'todo' : 'LightlineTodo'
      \ },
      \ }

let g:lightline.subseparator = { 'left': '', 'right': '|' }

function! LightlineTodo()
    return '[Todo:1]'
endfunction

function! LightlineGitbranch()
	let l:bname = FugitiveHead()
	return l:bname != '' ? l:bname : ''
endfunction
" }}}
" }}}
" {{{ Modal relative number
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
" }}}
" {{{ Trailling Whitespaces
" 1. highlight trailing whitespace in red
" 2. have this highlighting not appear while you are typing in insert mode
" 3. have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace guibg=#bd5353 ctermbg=131
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
command! Wc call TrailingWhitespace#DeleteTrailingWhitespaceAndSave()
" TODO: See @Wincent for a version that do not write todo history
" }}}
" {{{ Quickfix window / localtion list

" Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open).
" However, as part of the autocmd, this doesn't seem to happen.
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* nested cwindow
    " autocmd QuickFixCmdPost    l* nested lwindow " FIXME: For vim-QuickFixTodo, I
    " dont when this.. (i.e. find way to not apply this for Todo location list)
augroup END
" }}}
" {{{ Miscellaneous
"Add line without go in insert mode"
nnoremap = o<esc>
nnoremap + O<esc>j

" Move a line of text using CTRL+[jk] in visual mode
vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Weird mapping for my french mac keyboard when using US keybord layout
nnoremap § `
inoremap § `
inoremap ± ~

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Vimrc management
nnoremap <leader>, :edit $MYVIMRC<CR>
nnoremap <space>r :Runtime<CR>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Productif mapping
nnoremap <tab> %
nnoremap H ^
nnoremap L $

" More usefull path auto-complete
inoremap <C-f> <C-x><C-f>

" Copy end of line
nnoremap Y v$<left>y

" }}}
" {{{ Buffers and Windows navigation

" Remap basic windows command to space
nnoremap <space>wh <C-W>h
nnoremap <space>wj <C-W>j
nnoremap <space>wk <C-W>k
nnoremap <space>wl <C-W>l
nnoremap <space>w= <C-W>=
nnoremap <space>wo <C-W>o
nnoremap <space>ws <C-w>s
nnoremap <space>wv <C-w>v

" Quick buffers navigation
nnoremap <silent><space><space> :CtrlPBuffer<CR>
nnoremap <silent><space>[ :bprevious<CR>
nnoremap <silent><space>] :bnext<CR>
nnoremap <silent><space>d :bd<CR>
nnoremap <silent><space>D :bd!<CR>

" Fuzzer file openning
let g:ctrlp_map = '<space>f'

" If in git repo, fuzzy at git root, otherwise in current file directory
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 5000
let g:ctrlp_extensions = ['line', 'bookmarkdir', 'tag', 'Quickfix']
" TODO: Put CtrlP and fzf.vim in opt dir, if fzf availlable use it, otherwise
" use CtrlP
" Fuzzy file finder
" let g:fzf_action = {
"       \ 'ctrl-s': 'split',
"       \ 'ctrl-v': 'vsplit'
"       \ }
" let g:fzf_preview_window = 'right:60%'
" nnoremap <c-p> :Files<cr>
" augroup fzf
"   autocmd!
"   autocmd! FileType fzf
"   autocmd  FileType fzf set laststatus=0 noshowmode noruler
"     \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" augroup END
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
" {{{ Cursor navigation
" Move cyrsor in command-line
cnoremap <c-h> <left>
cnoremap <c-j> <s-left>
cnoremap <c-k> <s-right>
cnoremap <c-l> <right>
if has('win32') || has('win64')
    cmap <C-V> <C-R>+
endif

" Move cursor without exit insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <up>
inoremap <C-j> <down>

" Visual line navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}
" {{{ VimWiki
" let g:vimwiki_list = [{'path'            : '$HOME/vimwiki/',
"                      \ 'name'            : 'vimwiki',
"                      \ 'template_path'   : '$HOME/.vim/vimwiki/templates/',
"                      \ 'template_default': 'dark-theme',
"                      \ 'template_ext'    : '.html',
"                      \ 'auto_export'     : 1,
"                      \ 'auto_toc'        : 1}]

" let wiki_2 = {}
" let wiki_2.path= '$HOME/Documents/vim/wiki'
" let wiki_2.template_path= '$HOME/Documents/vim/wiki/templates'
" let wiki_2.template_default= 'def_template'
" let wiki_2.template_ext= '.html'

" let wiki_1 = {}
" let wiki_1.path = '$HOME/VimWiki'
" let wiki_1.path_html = '$HOME/VimWiki/html'
" let wiki_1.template_path= wiki_1.path_html . '/template'
" let wiki_1.template_default = 'default'
" let wiki_1.template_ext = '.htm'

let g:vimwiki_key_mappings =
  \ {
  \   'all_maps': 1,
  \   'global': 1,
  \   'headers': 0,
  \   'text_objs': 1,
  \   'table_format': 1,
  \   'table_mappings': 1,
  \   'lists': 1,
  \   'links': 1,
  \   'html': 1,
  \   'mouse': 0,
  \ }


let wiki = {}
let wiki.path= '$HOME/WIKI'
let wiki.path_html = '$HOME/WIKI/html'
let wiki.template_path= '$HOME/WIKI/templates'
let wiki.template_default= 'dark-template'
let wiki.template_ext= '.html'
let wiki.auto_export = 1
let wiki.auto_toc = 1

let g:vimwiki_list = [wiki]


" add the pre tag for inserting code snippets
" let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

" }}}
" {{{ Replace motion
nnoremap riw "_diwp
nnoremap raw "_dawp
vnoremap r "_dp

" }}}
" {{{ TODO's

" tnoremap <Esc> <C-\><C-n>

" Real Delete (no save in register)
" nnoremap <leader>dd "_d
" vnoremap <leader>d "_d

" While in insert mode, delete the last line (like <C-W>)
" inoremap <C-l> <esc>d(

" nnoremap <silent><leader>fd :if confirm('Delete file from system?', "&Yes\n&No", 1)==1 <Bar> exe ":Delete" <Bar> endif<CR><CR>
" nnoremap <leader>fm :Move<space>
" map <leader>fp :echo system("ls -l " . bufname("%") . " \| egrep -o '[rwx-]{10}'")<CR>:Chmod<space>

" }}}
" {{{ Status line
let g:currentmode={
      \ 'n'      : 'N ',
      \ 'no'     : 'N·Operator Pending ',
      \ 'v'      : 'V ',
      \ 'V'      : 'V.Line ',
      \ 'x22'    : 'V·Block ',
      \ "\<C-V>" : 'V.Block ',
      \ 's'      : 'Select ',
      \ 'S'      : 'S·Line ',
      \ 'x19'    : 'S·Block ',
      \ 'i'      : 'I ',
      \ 'R'      : 'R ',
      \ 'Rv'     : 'V·Replace ',
      \ 'c'      : 'Command ',
      \ 'cv'     : 'Vim Ex ',
      \ 'ce'     : 'Ex ',
      \ 'r'      : 'Prompt ',
      \ 'rm'     : 'More ',
      \ 'r?'     : 'Confirm ',
      \ '!'      : 'Shell ',
      \ 't'      : 'T '
      \}

" TODO: put this dynamic with colorsheme
function! StatusLineModeColor()
    try
        if (mode() =~# '\v(n|no)')
            " hi! StatusLineMode guifg=#1F2F38 ctermfg=236 guibg=#84B97C ctermbg=108
            hi! StatusLineMode guifg=#1F2F38 ctermfg=236 guibg=#689d6a ctermbg=108
        elseif (mode() ==# 'i')
            " hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=74 guibg=#639EE4
            hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=74 guibg=#98971a
        elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
            " hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=173 guibg=#E18254
            hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=173 guibg=#d65d0e
        else
            " hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=108 guibg=#DC657D
            hi! StatusLineMode guifg=#1F2F38 ctermfg=236 ctermbg=108 guibg=#fb4934
        endif
        return get(g:currentmode, mode(), '')
    catch /.*/
        return 'N ' " mode() is not in dictionnary
    endtry

endfunction

" neodark theme bases color
let s:base1 = ['#1F2F38', 236]
let s:base2 = ['#263A45', 237]
let s:base3 = ['#475C69', 59]
let s:base4 = ['#658595', 245]
let s:base5 = ['#AABBC4', 250]

function! StatuslineGit()
    try
        let l:branch_name = FugitiveHead()
    catch /.*/
        return ''
    endtry
    if l:branch_name == ''
        return ''
    else
        return 'Git[' . l:branch_name . ']'
endfunction


if !has('g:vim_QuickFixWindows')
    " XXX: return b:todo_count=0 when plugin is not loaded to insure status line
    " display correctly.
    function! CountMatches(foo)
        return 0
    endfunction
endif

function! StatusLineTodo()
    if b:todo_count > 0
        return '[Todo:' . b:todo_count . ']'
    else
        return ''
endfunction

autocmd! BufEnter * let b:todo_count = CountMatches('TODO:') | call FocusedStatusLine()
autocmd! BufWrite * let b:todo_count = CountMatches('TODO:')
autocmd! VimEnter * call FocusedStatusLine()
autocmd! WinEnter * call FocusedStatusLine()
autocmd! WinLeave * call UnfocusedStatusLine()

function! FocusedStatusLine()
    setlocal statusline=
    setlocal statusline+=%#StatusLineMode#
    setlocal statusline+=\ %{StatusLineModeColor()}
    setlocal statusline+=%#CursorColumn#
    setlocal statusline+=\ %f
    setlocal statusline+=\ %m
    setlocal statusline+=\ %{StatuslineGit()}
    setlocal statusline+=%=
    setlocal statusline+=%{StatusLineTodo()}
    setlocal statusline+=\ %y
    setlocal statusline+=\ %{&fileencoding?&fileencoding:&encoding}
    setlocal statusline+=\[%{&fileformat}\]
    setlocal statusline+=\ %p%%
    setlocal statusline+=\ %l:%c
    setlocal statusline+=\ "
endfunction

function! UnfocusedStatusLine()
    setlocal statusline=
    setlocal statusline+=%#CursorColumn#
    setlocal statusline+=\ %f
    setlocal statusline+=\ %m
    setlocal statusline+=%=
    setlocal statusline+=\ %y
    setlocal statusline+=\ %l:%c
    setlocal statusline+=\ "
endfunction

" }}}
