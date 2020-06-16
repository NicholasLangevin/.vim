

function! CreateGistInVimwiki(wikiroot) range
    " This fonction need to be call in visual mode
    let l:lines = getline(a:firstline, a:lastline)
    let l:gist = getreg('g')
    let l:gist_name = input("Gist name: ")
    normal! "gy
    normal! :<esc> " TODO: remove this!
    let l:wikiroot = a:wikiroot
    let l:filetype = &filetype
    " if a:wikiroot[-1:] == '/'
    "     let l:wikiroot = a:wikiroot[:-2]
    " endif
    let l:newfile_name = l:wikiroot . '/' . l:filetype . '/gists/' . l:gist_name . '.wiki'
    exe 'edit' . l:newfile_name
    put ='%title ' . l:filetype . '/Gists'
    put =''
    put =''
    put ='==== ' . l:gist_name . ' ===='
    put =''
    put ='{{{' . &filetype
    put =l:lines
    put ='}}}'
    " write
    " edit " vimwiki need this for syntax highlight
endfunction

noremap <F2> :call CreateGistInVimwiki('$HOME/WIKI')<CR>

