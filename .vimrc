" Methos's .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set background=dark
filetype plugin on
set autoindent
set clipboard=unnamed       " use system clipboard
set pastetoggle=<F2>        " paste mode
set expandtab
set smarttab
set tabstop=4
set incsearch
set hlsearch
set ignorecase smartcase    " make searches case-sensitive only if they
set shiftwidth=4
set softtabstop=4
set bs=2
set encoding=utf8
set ffs=unix,dos,mac

set ignorecase
syntax on
syntax enable

" show line numbers when i press f4
highlight LineNr ctermbg=0 ctermfg=5
nmap <silent> <F4> :set invnumber<CR>
imap <silent> <F4> <ESC>:set invnumber<CR>i

" allow file saving as root when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" crappy hex editor
nmap <silent> <F8> :call Edithex()<CR>
nmap <silent> <F9> :set nobinary<CR>:set eol<CR>

function Edithex()
    set binary
    set noeol
    if $hex_input == 1
        :%!xxd -r
        let $hex_input = 0
    else
        :%!xxd
        let $hex_input = 1
    endif
endfunction

" column border highlighting, turned off for now
 highlight ColorColumn ctermbg=0
" execute "set colorcolumn=" . join(range(81,335), ',')

filetype plugin on
au FileType c setl ofu=ccomplete#CompleteCpp

