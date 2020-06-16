"         _                         _     _      _           _
"  __   _(_)_ __ ___      __      _| |__ (_) ___| |__       | | _____ _   _
"  \ \ / / | '_ ` _ \ ____\ \ /\ / / '_ \| |/ __| '_ \ _____| |/ / _ \ | | |
"   \ V /| | | | | | |_____\ V  V /| | | | | (__| | | |_____|   <  __/ |_| |
"    \_/ |_|_| |_| |_|      \_/\_/ |_| |_|_|\___|_| |_|     |_|\_\___|\__, |
"                                                                     |___/
"


" {{{ Settings
let g:which_key_flatten = 0          | " Try to flatten out the keymappings if necessary.
let g:which_key_exit = "\<esc>"      | " Use <esc> to exit the cheatsheet
let g:which_key_use_floating_win = 0 | " Don't use floting windows

" ~~ Hide status bar ~~
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

" {{{ Vimwiki
let g:which_key_vimwiki = {}
let g:which_key_vimwiki['w'] = 'open-wiki'
let g:which_key_vimwiki['t'] = 'which_key_ignore'
let g:which_key_vimwiki['s'] = 'select-wiki'


call which_key#register(',w', "g:which_key_vimwiki")
nnoremap <silent> <leader>w :<c-u>WhichKey '<leader>w'<CR>
" }}}
