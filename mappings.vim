" Map leader key
:let mapleader = ","
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
nnoremap <silent> <Leader><Leader>c :call Commit()<cr>

" View PR list in fzf
nnoremap <silent> <leader>p :call fzf#run({ 
    \ 'source': 'arc pr list',
    \ 'window': { 'width': 0.8, 'height': 0.7 },
    \ 'options': '--multi --reverse
                \ --header "enter: view in browser"
                \ --bind "enter:execute(arc pr view --id {1})+abort"' })<cr>

" View arc branches list in fzf
nnoremap <silent> <leader>b :call fzf#run({ 
    \ 'source': 'arc branch',
    \ 'window': { 'width': 0.8, 'height': 0.7 },
    \ 'options': '--multi --reverse 
                \ --header "enter: checkout, ctrl-d: delete branch, ctrl-\: force delete branch"
                \ --bind "enter:execute(echo {} \| sed \"s/*//\" \| xargs arc checkout)+abort"
                \ --bind "ctrl-r:reload(arc branch)"
                \ --bind "ctrl-d:execute(echo {+} \| sed \"s/*//\" \| xargs -p arc branch --delete)"
                \ --bind "ctrl-\:execute(echo {+} \| sed \"s/*//\" \| xargs -p arc branch -D)"' })<cr>

" View arc status in fzf
nnoremap <silent> <leader>s :call fzf#run({ 
    \ 'source': 'arc status -s',
    \ 'window': { 'width': 0.9, 'height': 0.7 },
    \ 'options': '--multi --reverse --print-query
                \ --preview "arc diff HEAD {2} \| bat --color=always --theme=\"TwoDark\""
                \ --header "ctrl-a: stage, ctrl-u: ustage, ctrl-x: revert changes"
                \ --bind "ctrl-r:reload(arc status -s)"
                \ --bind "ctrl-a:execute(arc add {2})"
                \ --bind "ctrl-u:execute(arc reset {2})"
                \ --bind "ctrl-x:execute(echo {2} \| xargs -p arc checkout)"
                \ --bind "ctrl-m:execute(arc commit --no-verify -m {})"' })<cr>

" View arc log in fzf
nnoremap <silent> <leader>l :call fzf#run({ 
    \ 'source': 'arc log --oneline',
    \ 'window': { 'width': 0.9, 'height': 0.8 },
    \ 'options': '--multi --reverse --print-query
                \ --preview "arc show {1} \| bat --color=always --theme=\"TwoDark\""
                \ --header "ctrl-c: copy commit hash, ctr-o: open in arcanum"
                \ --bind "ctrl-c:execute(echo {1} \| pbcopy)"
                \ --bind "ctrl-o:execute(open https://a.yandex-team.ru/arc_vcs/commit/{1})"' })<cr>

