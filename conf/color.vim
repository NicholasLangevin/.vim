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
