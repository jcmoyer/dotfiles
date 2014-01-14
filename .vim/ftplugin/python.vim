setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2

" Map F5 to run the current script
if has("unix")
  nmap <buffer> <F5> :!python "%:p"<CR>
else
  nmap <buffer> <F5> :!python "%:p"<CR>
endif

