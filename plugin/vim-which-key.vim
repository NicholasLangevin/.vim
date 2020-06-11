"         _                         _     _      _           _              
"  __   _(_)_ __ ___      __      _| |__ (_) ___| |__       | | _____ _   _ 
"  \ \ / / | '_ ` _ \ ____\ \ /\ / / '_ \| |/ __| '_ \ _____| |/ / _ \ | | |
"   \ V /| | | | | | |_____\ V  V /| | | | | (__| | | |_____|   <  __/ |_| |
"    \_/ |_|_| |_| |_|      \_/\_/ |_| |_|_|\___|_| |_|     |_|\_\___|\__, |
"                                                                     |___/ 
"


finish


" {{{ Settings
let g:which_key_flatten = 0          | " Try to flatten out the keymappings if necessary.
let g:which_key_exit = "\<esc>"      | " Use <esc> to exit the cheatsheet
let g:which_key_use_floating_win = 0 | " Don't use floting windows

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR

" ~~ Hide status bar ~~
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

" {{{ Sections Definition
let g:which_key_map = {}
let g:which_key_map['w'] = { 'name' : '+window'   }
let g:which_key_map['f'] = { 'name' : '+file'     }
let g:which_key_map['b'] = { 'name' : '+buffer'   }
let g:which_key_map['g'] = { 'name' : '+git'      }
let g:which_key_map['m'] = { 'name' : '+mode'     }
let g:which_key_map['i'] = { 'name' : '+insert'   }
let g:which_key_map['t'] = { 'name' : '+terminal' }
let g:which_key_map['T'] = { 'name' : '+Toggle'   }
" }}}

" {{{ Mappings Definition
" This part was auto-generated on Tue Jun  2 17:24:36 EDT 2020
" (see https://github.com/NicholasLangevin/dotfiles/scripts/vim-which-key.sh)

let g:which_key_map['w']['d'] = 'delete'
let g:which_key_map['w']['='] = 'resize'
let g:which_key_map['w']['s'] = 'fzf-split'
let g:which_key_map['w']['v'] = 'fzf-vsplit'
let g:which_key_map['w']['h'] = 'which_key_ignore'
let g:which_key_map['w']['j'] = 'which_key_ignore'
let g:which_key_map['w']['k'] = 'which_key_ignore'
let g:which_key_map['w']['l'] = 'which_key_ignore'
let g:which_key_map['w']['o'] = 'which_key_ignore'
let g:which_key_map['w']['H'] = 'which_key_ignore'
let g:which_key_map['w']['J'] = 'which_key_ignore'
let g:which_key_map['w']['L'] = 'which_key_ignore'
let g:which_key_map['w']['K'] = 'which_key_ignore'
let g:which_key_map['b']['['] = 'bprevious'
let g:which_key_map['b'][']'] = 'bnext'
let g:which_key_map['b']['{'] = 'bfirst'
let g:which_key_map['b']['}'] = 'blast'
let g:which_key_map['d'] = 'bdelete'
let g:which_key_map['f']['f'] = 'open'
let g:which_key_map['f']['g'] = 'git-open'
let g:which_key_map['f']['r'] = 'rename'
let g:which_key_map['f']['d'] = 'delete'
let g:which_key_map['f']['m'] = 'move'
let g:which_key_map['f']['p'] = 'permission'
let g:which_key_map['g']['a'] = 'add'
let g:which_key_map['g']['s'] = 'status'
let g:which_key_map['g']['c'] = 'commit'
let g:which_key_map['r'] = 'which_key_ignore'
" }}}
