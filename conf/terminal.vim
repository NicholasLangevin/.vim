

" We can rename buffer with :file {name}
" TODO: Instead of one terminal buffer attached, have possibility to attach 
" multiple buffer for indepentend session. Maybe do not see attach in buffer 
" name.


autocmd TerminalWinOpen * setlocal laststatus=0 noshowmode noruler 

map <leader>tt :call CreateTerminal('R --quiet', 'R (attached)')<CR>
function! CreateTerminal(job, termName)
    let l:currentWindow = winnr()
    " FIXME: Lag when open second terminal with the same name. When 
    " term_name is specified, doesn't add (1)..
    call term_start(a:job,  {'term_finish' : 'close',
                            \ 'term_name' : a:termName})
    let g:attachedBuffer = bufnr(a:termName)
    execute l:currentWindow . "wincmd w"
    return ''
endfunction

map <leader>ss :call SendTextToTerminal(getline("."))<CR>
function! SendTextToTerminal(text)
    call term_sendkeys(g:attachedBuffer, a:text."\<CR>")
endfunction


map <leader>cc :call CloseTerminal(g:attachedBuffer)<CR>
function! CloseTerminal(termBuffer)
    execute "silent! bdelete!" .  a:termBuffer
    " FIXME:Restore status line event when quitting manually without using BufLeave
    set laststatus=2 noshowmode ruler 
endfunction

