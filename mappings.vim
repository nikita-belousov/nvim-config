" Map leader key
let g:mapleader = ","

" Emmet trigger key
let g:user_emmet_leader_key='<C-E>'

" Toggle terminal
let g:toggleterm_terminal_mapping = '<C-o>'

" Open coc file explorer
noremap <silent> <C-f> :CocCommand explorer --width 60<cr>

" Open coc actions list
nnoremap <silent> <Leader>a :CocAction<cr>

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

" Enable/disable Signify plugin
nnoremap <silent> <Leader>s :SignifyToggle<cr>

" Signify show changes under cursor in popup
nnoremap <silent> <Leader>d :SignifyHunkDiff<cr>

" Signify undo changes under cursor
nnoremap <silent> <Leader>u :SignifyHunkUndo<cr>

" Source vim config file
nnoremap <silent> <Leader><Leader>s :source $MYVIMRC<cr>

" Open current file in Arcanum
nnoremap <silent> <Leader><Leader>a :call OpenCurrentFileInArcanum()<cr>

" Open current ticket in Startrek
nnoremap <silent> <Leader><Leader>t :call OpenCurrentStarTrekTicket()<cr>

" Arc commit
nnoremap <silent> <Leader><Leader>c :call ArcCommit()<cr>

" View PR list in fzf
nnoremap <silent> <leader>p :call ArcPRList()<cr>

" View arc status in fzf
nnoremap <silent> <leader>s :call ArcStatus()<cr>

" View arc branches list in fzf
nnoremap <silent> <leader>b :call ArcBranches()<cr>

" View arc log in fzf
nnoremap <silent> <leader>l :call ArcLog()<cr>

" View arc blame in fzf
nnoremap <silent> <leader>h :call ArcBlame()<cr>
