function! OpenCurrentFileInArcanum()
  let file_dir = expand('%:h')
  let arc_root = system('cd ' . file_dir . '; arc rev-parse --show-toplevel | tr -d "\n"')
  let file_path = substitute(expand('%:p'), arc_root . '/', '', '')
  let rev_number = system('arc rev-parse HEAD | tr -d "\n"')
  let line_number = line(".")
  let url = 'https://a.yandex-team.ru/arc_vcs/' . file_path . '\?rev=' . rev_number . '#L' . line_number
  call system('open ' . url)
endfunction

function! OpenCurrentStarTrekTicket()
  let ticket = system('arc branch | grep "*" | egrep -o "YDO-\d+"')
  let url = 'https://st.yandex-team.ru/' . ticket
  call system('open ' . url)
endfunction

function! OpenFile(fullpath)
    let path = get(split(a:fullpath, ' '), 1)
    echo path
    execute "e ".fnameescape(path)
endfunction

function! ArcStatus()
    call fzf#run({ 
                \ 'source': 'arc status -s',
                \ 'window': { 'width': 0.9, 'height': 0.7 },
                \ 'sink': function('OpenFile'),
                \ 'options': '--multi --reverse --print-query
                            \ --preview "arc diff HEAD {2} | bat --color=always --theme=\"TwoDark\""
                            \ --header "ctrl-a: stage, ctrl-u: ustage, ctrl-x: revert changes"
                            \ --bind "ctrl-r:reload(arc status -s)"
                            \ --bind "ctrl-a:execute(arc add {2})"
                            \ --bind "ctrl-u:execute(arc reset {2})"
                            \ --bind "ctrl-x:execute(echo {2} | xargs -p arc checkout)"' })
endfunction

function! ArcPRList()
    call fzf#run({ 
                \ 'source': 'arc pr list',
                \ 'window': { 'width': 0.8, 'height': 0.7 },
                \ 'options': '--multi --reverse
                            \ --header "enter: view in browser"
                            \ --bind "enter:execute(arc pr view --id {1})+abort"' })
endfunction

function! ArcBranches()
    call fzf#run({ 
                \ 'source': 'arc branch',
                \ 'window': { 'width': 0.8, 'height': 0.7 },
                \ 'options': '--multi --reverse 
                            \ --header "enter: checkout, ctrl-d: delete branch"
                            \ --bind "enter:execute(echo {} | sed \"s/*//\" | xargs arc checkout)+abort"
                            \ --bind "ctrl-r:reload(arc branch)"
                            \ --bind "ctrl-d:execute(echo {+} | sed \"s/*//\" | xargs -p arc branch -D)"' })
endfunction

function! ArcLog()
    call fzf#run({ 
                \ 'source': 'arc log --oneline',
                \ 'window': { 'width': 0.9, 'height': 0.8 },
                \ 'options': '--multi --reverse --print-query --header-first
                            \ --preview "arc show --name-only {1}"
                            \ --header "ctrl-c: copy hash, enter: show content, ctr-a: arcanum"
                            \ --bind "ctrl-c:execute(echo {1} | pbcopy)"
                            \ --bind "ctrl-a:execute(open https://a.yandex-team.ru/arc_vcs/commit/{1})"
                            \ --bind "enter:preview(arc show {1} | bat --color=always --theme=\"TwoDark\")"' })
endfunction

function! ArcBlame()
    :call fzf#run({ 
                \ 'source': 'arc blame ' . @%,
                \ 'window': { 'width': 0.9, 'height': 0.8 },
                \ 'options': '--multi --reverse --print-query --header-first
                            \ --header "ctrl-c: copy hash, ctr-a: arcanum"
                            \ --bind "ctrl-c:execute(echo {1} \| pbcopy)"
                            \ --bind "ctrl-a:execute(open https://a.yandex-team.ru/arc_vcs/commit/{1})"' })
endfunction

function! ArcCommit()
    " проверка есть ли изменения для коммита
    let status_output = system("arc status")
    if (stridx(status_output, "no changes added to commit") != -1)
        echohl ErrorMsg
        echomsg "no changes added to commit"
        echohl None
        return
    elseif (stridx(status_output, "nothing to commit") != -1)
        echohl ErrorMsg
        echomsg "nothing to commit"
        echohl None
        return
    endif
    
    let confirm = confirm("Commit staged files?", "&Yes\n&No", 1)
    redraw
    if (confirm == 2)
        return
    endif

    let commit_cmd = 'arc commit --no-verify'
    let commit_msg = trim(input("Commit message: "))
    redraw
    if (commit_msg == "")
        echoerr "empty commit message"
        return
    endif
    let commit_cmd = commit_cmd . " -m '" . commit_msg . "'"
    let commit_output = system(commit_cmd)
    if (stridx(commit_output, commit_msg) != -1)
        echo "Committed successfully"
    else
        echohl ErrorMsg
        echomsg commit_output
        echohl None
    endif
endfunction
