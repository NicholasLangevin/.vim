
" Rstudio send and jump to the next non empty line
" smart-R.vim send and jump on line below. If a empty line is sended, skipped all empty line and send next available line


function! SendCurrentLine() range
    let l:lines = getline(a:firstline, a:lastline)
    let l:currentLineNumber = line('.')
    let l:nbLines = len(l:lines)
    if l:nbLines == 1
        if l:lines[0] =~ '^\s*$' || l:lines[0] =~ "^#"
            normal j
            " TODO: For now, comment are skipped and are not sended to the REPL: Could be global parameter to send or not..
            call SendCurrentLine()
        else
            call neoterm#repl#line(a:firstline, a:lastline)
            normal j
        endif
    else
        call neoterm#repl#line(a:firstline, a:lastline)
        " TODO: Move cursor nbLine()
    endif
endfunction

" nmap <CR> <Plug>(neoterm-repl-send-line)
nnoremap <CR> :call SendCurrentLine()<CR>

" nnoremap <localleader>o :call VimuxOpenRunner()<CR>
" nnoremap <localleader>c :call VimuxCloseRunner()<CR>
" nnoremap <localleader>n :call VimuxOpenRunner()<CR>:call VimuxSendText("R\n")<CR>

" let g:which_key_map.w = {
"       \ 'name' : '+major' ,
"       \ 'o' :  'open-R-session'   ,
"       \ 'c' :  'close-R-session'  ,
"       \ 'n' :  'new-R-session'    ,
"       \ }


" TODO: <leader> inp new pane with current file sourced, and focus ?
" TODO: Rmd/Sweave send chunck of code
" TODO: Send all files or save and source files?

" nnoremap <leader>d :call VimuxCurrentSelection("n")<CR>"
" TODO: wrap this into one function + if no open-pane, open..
" nnoremap <silent><CR> :call VimuxCurrentSelection("n")<CR>
" vnoremap <silent><CR> "vy :call VimuxSendRegister_v()<CR>

" Send R command directly from vim buffer
" let g:VimuxPromptString = "tmux: "
" map <space><space> :VimuxPromptCommand<CR>

" Select current paragraph and send it to tmux
" nmap <leader>d vip"vy:call VimuxSendRegister_v()<CR>

" Inspect runner pane map (TODO: setup copy-mode in tmux)
" map <leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner page ("<bind-key> z") come back
 " map <leader>vz :VimuxZoomRunner<CR>

" Cancel current running statement directly from vim buffer
" nnoremap <C-c> :call VimuxSendKeys("C-c")<CR>
