
function! TrailingWhitespace#DeleteTrailingWhitespaceAndSave()
" Deletes all trailing whitespace and newlines at end of file.
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e   " Delete trailing whitespace
    %s/\n\+\%$//e " Delete newlines at end of file
    normal 'yz<CR>
    normal `z
  endif
  write
endfunction
