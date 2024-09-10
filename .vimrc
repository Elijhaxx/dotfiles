" Set compatibility to Vim only
set nocompatible

" Sets both line and relative line number
set number relativenumber

" Status bar
set laststatus=2

" Text wrap on long lines
set wrap

" Set syntax highlighting
syntax on

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

colorscheme nord
