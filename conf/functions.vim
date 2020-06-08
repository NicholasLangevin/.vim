"============== Custom Functions ===============

function CompileFile()
    write
    "Set this variable to compile as different name"
    if exists("g:compileName")
        execute "!~/MydotFiles/InfinyCompiler.sh % -n" g:compileName
    else
        !~/MydotFiles/InfinyCompiler.sh % 
    endif
endfunction

function VimuxCurrentSelection(mode)
    
    if a:mode == "n"
        normal! "xyy
        let l:currentSelection = getreg('x')
        normal j
    elseif a:mode == "v"
        normal! "xy
        let l:startingPos = getpos("'<")
        let l:endingPos   = getpos("'>")
        let l:nSkipLines = l:endingPos[1] - l:startingPos[1] + 2
        let l:currentSelection = getreg('x') 
        execute "normal!" l:nSkipLines "j"
    endif

    :call VimuxSendText(l:currentSelection)

endfunction 

function! VimuxSendRegister_v()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" Pas encore mapper
function! ToggleSpellLang()
    " toggle between en and fr
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=en
    endif
endfunction


function! EchoWarning(msg)
    " Return warning with style
    echohl WarningMsg
    echo "Warning"
    echohl None
    echon ': ' a:msg
endfunction

function! RequirePlugin(mapping, plugin)
    " Execute mapping only if require plugin is loaded, otherwise echo warning
    if &runtimepath =~ a:plugin
        execute a:mapping
    else
        call EchoWarning("require '" . a:plugin . "' plugin")
    endif
endfunction
