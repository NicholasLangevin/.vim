"============== Custom Commands ===============

"Automaticly close vim if the only buffer left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul

:autocmd InsertEnter * set norelativenumber
:autocmd InsertLeave * set relativenumber

" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

