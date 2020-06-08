

nnoremap <leader>mo :call VimuxOpenRunner()<CR>
nnoremap <leader>mc :call VimuxCloseRunner()<CR> 
nnoremap <leader>mn :call VimuxOpenRunner()<CR>:call VimuxSendText("R\n")<CR>
nnoremap <silent><CR> :call VimuxCurrentSelection("n")<CR>
vnoremap <silent><CR> "vy :call VimuxSendRegister_v()<CR>

" see :digraphs
inoremap <C-e>/ <C-k>e'
inoremap <C-e>' <C-k>e`
inoremap <C-e>[ <C-k>e^
inoremap <C-\> <C-k>a!

noremap <silent><leader>o :!open -a "skim" %:r.pdf<CR><CR>


"Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent><C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endi


"Replace motion: delete and yank the last copy
nnoremap riw ciw<esc>"0p
vnoremap r c<esc>"0p


" Open chrome and do a google research (see bash function 'Google')
" FIXME: Google fonciton not seen by ! command
nnoremap <expr> goo ":!Google " .  input("Google: ") . "<CR>" . "<CR>"


"Enable/Disable spell check
nnoremap <leader>z :setlocal spell!<cr>


"Center without exit insert mode 
inoremap <C-z><C-z>  <esc>zza

"quick pairs 
" inoremap <leader>' ''<ESC>i
" inoremap <leader>" ""<ESC>i
" inoremap <leader>( ()<ESC>i
" inoremap <leader>[ []<ESC>i
" inoremap <leader>{ {}<ESC>i
" inoremap <silent>{<CR> {<ESC>b :call SavePos()<CR>o<ESC>ia}<ESC>hx g:col . is<ESC>

" Save and reload vimrc
nnoremap <silent><leader>r :w<CR>:source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

"============== functions Mappings ===============

" {{{ Major mode
" ~~ Compile/run the file depending on the filetype ~~
nnoremap <leader>mc :call CompileFile()<CR>


"
" }}}

"============== NERDTree Mappings ===============
" let NERDTreeQuitOnOpen = 1
" let NERDTreeShowHidden=1

"Open and close the files tree
" nnoremap <silent><leader>b :NERDTreeToggle<CR>


"============== vim-mergetool Mappings ===============
nnoremap <silent><leader>mt :MergetoolToggle<CR>

" completion programation
"https://www.reddit.com/r/vim/comments/38d9ts/ideas_for_using_the_leader_key_feature/
inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ""<CR>
set omnifunc=syntaxcomplete#Complete


" IDEA: =====
"<leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

