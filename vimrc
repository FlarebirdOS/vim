" 
" /etc/vimrc
" 

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
    set background=dark
endif

" add tab space
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent