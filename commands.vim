" Auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" Use scss syntax for pcss files
autocmd BufRead,BufNewFile *.pcss set ft=scss

" Ack search
command! -nargs=1 S :Ack -i --ignore-dir=node_modules --ignore-dir=build <args>

function! HandleWinClosed(...)
    echo args
endfunction
