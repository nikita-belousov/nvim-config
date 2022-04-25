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

function! Commit()
    :TermExec cmd='com'
endfunction
