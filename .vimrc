execute pathogen#infect()

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set background=light

set number            " show line numbers in vim
"set relativenumber    " show relative line numbers, not sure why this is
"useful yet

"set tabstop=2         " number of visual spaces per TAB
set expandtab         " (et) expand tabs to spaces (use :retab to redo entire file)

:nmap <Enter> O<ESC>   "in normal mode (nmap), map "Enter" to what capital O does
                       "(which is adding a newline above your cursor)

:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set shiftwidth=2
:autocmd Filetype ruby set tabstop=2
