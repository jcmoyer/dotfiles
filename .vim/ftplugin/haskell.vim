setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2

" Map F5 to load the current file into ghci
if has("unix")
  nmap <buffer> <F5> :!ghci "%:p"<CR>
else
  nmap <buffer> <F5> :!start ghci "%:p"<CR>
endif

