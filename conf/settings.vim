"   ____         _    _    _               
"  / ___|   ___ | |_ | |_ (_) _ __    __ _ 
"  \___ \  / _ \| __|| __|| || '_ \  / _` |
"   ___) ||  __/| |_ | |_ | || | | || (_| |
"  |____/  \___| \__| \__||_||_| |_| \__, |
"                                    |___/ 

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

