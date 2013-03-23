" Adds Vim features (not combatible with vi)
set nocompatible

" See ':help i_backspacing'
" This basically specifies what backspace will erase in insert mode.
set backspace=indent,eol,start

" On the VMS system, we don't keep a backup of the file because it does that
" automatically. Otherwise, enable it. When enabled, backups will have the
" original filename with an '~' appended to it.
if has("vms")
  set nobackup
else
  set backup
endif

" Keep 1000 lines of command history
set history=1000
" Display the cursor position in the lower right corner of the window
set ruler
" Displays commands as you type them in in the lower right corner of the
" window
set showcmd
" Incremental searching (shows matches WHILE typing)
set incsearch
" Numbered lines
set number
" Display a right margin at 80 columns
set colorcolumn=80
" Some stuff for tab completion
set wildmenu
set wildmode=list:longest,full
set wildchar=<Tab>

" Theme
colorscheme molokai

if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h10:cANSI
  else
    set guifont=Inconsolata\ 12
  endif

  " Default window size for gvim
  set lines=30
  set columns=85

  " Turn off the menubar and toolbar
  set guioptions-=m guioptions-=T
endif

if has("gui_running")
  " Map Ctrl+Space to autocomplete
  inoremap <C-Space> <C-n>
else
  if has("unix")
    " In unix terminals, <Nul> is the name of the symbol created when Ctrl
    " and Space are pressed together
    inoremap <Nul> <C-n>
  endif
endif

" If colors are available, turn on syntax highlighting and last-match
" highlighting.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Enable the mouse if it is available.
if has('mouse')
  set mouse=a
endif

" Map Ctrl+T to create a tab
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>i

" Enable plugins and indentation based on filetype
filetype plugin on
filetype indent on

" Disable automatic comment insertion on <CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Always use spaces for tabs and with a width of 2
autocmd FileType * setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2

" Do not indent access specifiers
set cinoptions+=g0
" Use two spaces on the next line continuing from unclosed parentheses
set cinoptions+=(2

" Haskell
" Map F5 to load the current file into ghci
if has("unix")
  autocmd FileType haskell nmap <buffer> <F5> :!ghci "%:p"<CR>
else
  autocmd FileType haskell nmap <buffer> <F5> :!start ghci "%:p"<CR>
endif

" Python
" Map F5 to run the current script
if has("unix")
  autocmd FileType python nmap <buffer> <F5> :!python "%:p"<CR>
else
  autocmd FileType python nmap <buffer> <F5> :!python "%:p"<CR>
endif

" pathogen.vim (https://github.com/tpope/vim-pathogen)
execute pathogen#infect()

" Windows GVIM requires these encoding settings for NERDTreeDirArrows to work
" properly.
if has("win32")
  scriptencoding utf-8
  set encoding=utf-8
  let NERDTreeDirArrows=1
endif
