" Map leader key
:let mapleader = ","
" Emmet trigger key
let g:user_emmet_leader_key='<C-E>'

" Toggle terminal
let g:toggleterm_terminal_mapping = '<C-o>'

" Open coc file explorer
noremap <silent> <C-f> :CocCommand explorer --width 60<cr>

" Eslint autofix
nnoremap <silent> <Leader>[ :CocCommand eslint.executeAutofix<cr>

" Symbol renaming
nmap <leader>] <Plug>(coc-rename)

" Open vim config file i a new tab
noremap <silent> <Leader>v :tabe $MYVIMRC<cr>

" Source vim config
nnoremap <silent> <Leader>s source $MYVIMRC<cr>

" List recently used files
nnoremap <silent> <Leader>e :FZFMru<cr>

" Fuzzy search file
nnoremap <silent> <Leader>f :Files<cr>

" Fuzzy search tab
nnoremap <silent> <Leader>w :Windows<cr>

" Open new empty tab
nnoremap <silent> <Leader>t :tabnew<cr>

" Signify show changes under cursor in popup
nnoremap <silent> <Leader>d :SignifyHunkDiff<cr>

" Signify undo changes under cursor
nnoremap <silent> <Leader>u :SignifyHunkUndo<cr>
