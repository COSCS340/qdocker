set path+=./** " Recursive file searching
set wildmode=full " Display multiple results
set wildmenu

" Create a tags file in the current directory
command! MakeTags !ctags -R .
command! RemoveTags !rm ./tags
" '<Ctrl>]' to jump to tag under cursor
" 'g<Ctrl>]' jump to abiguous tags under cursor
" '<Ctrl>t' to jump back to the tab stack

:syntax on
set relativenumber
set number
set t_kb=
set nocompatible
set backspace=eol,indent,start
set autoindent
set smartindent
set viminfo="h"
set nowrap
set vb
set pastetoggle=<f5>
set tabstop=4
set shiftwidth=4
set tw=100
set softtabstop=4
set smarttab
set ruler
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set background=dark
set showmode
set showmatch
set ignorecase
set smartcase
set report=0
set scrolloff=10
set incsearch
set hlsearch
colorscheme elflord
set showtabline=2
set textwidth=110
let mapleader=" " " <leader> is <Space>

"let &mp = 'latex \\nonstopmode \\input\{$*}'

hi StatusLine                  ctermfg=LightYellow ctermbg=Black     cterm=NONE
hi StatusLineNC                ctermfg=Black     ctermbg=LightYellow     cterm=NONE

imap jj <Esc>

nnoremap <leader>n :set relativenumber!<cr>
noremap <leader>w <C-w>
noremap <leader>cn :cnext<cr>
noremap <leader>cp :cprevious<cr>
noremap <leader>co :copen<cr>
noremap <leader>cc :cclose<cr>
noremap <leader>cf :cnf<cr>
nnoremap _ <C-^>
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr><C-L>
nnoremap <leader>m :w<cr>:silent make!\|redraw!\|cc<CR>
nnoremap <leader>h :noh<cr>
nnoremap ZX :w<cr>

augroup spelling
	autocmd FileType plaintex :nnoremap <buffer> <C-l> [s1z=<C-O>
	autocmd FileType plaintex :inoremap <buffer> <C-l> <Esc>[s1z=']a
augroup end
