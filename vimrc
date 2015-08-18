" Based on: http://amix.dk/vim/vimrc.html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax enable         " Syntax highlighting
filetype plugin on    " Enables auto-loading of filetype plugins
set nocp              " Don't use vi defaults
set hidden            " Hides buffers
set title             " Shows the file title in the window title
set ruler             " Show row and column position in file
set clipboard=unnamed " Enable pasting from system clipboard
set autoread          " Automatically read file on change
set noswapfile

let mapleader = ","

" Fast saving
nmap <leader>w :w<cr>

" Fast editing of .vimrc
map <leader>e :tabnew ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc :source ~/.vimrc

" Enable mouse
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts and colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme nilezell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc. commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vmap <C-s> :<C-u>'<,'>sort u<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set smartcase
set hlsearch
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*.o,*.png,*.svg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_extra_conf_globlist = ['~/project/*']
map <F2> :YcmCompleter GoToDefinition<cr>
map <F3> :YcmCompleter GoToDeclaration<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<cr>
nnoremap <leader>l :call ToggleLocationList()<cr>
" s: Find this C symbol
nnoremap <leader>fs :call cscope#find('s', expand('<cword>'))<cr>
" g: Find this definition
nnoremap <leader>fg :call cscope#find('g', expand('<cword>'))<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader><tab> <C-w><C-w>
let &winheight = &lines * 7 / 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2 " The number of spaces in the tab
set tabstop=2
set smarttab     " The tab is deleted as one character

set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {      {}<left>
inoremap {<cr>  {<cr>}<esc>O
inoremap {<tab> {
inoremap {}     {}

inoremap [      []<Left>
inoremap [<cr>  [<cr>]<esc>O
inoremap [<tab> [
inoremap []     []

inoremap (      ()<Left>
inoremap (<cr>  (<cr>)<esc>O
inoremap (<tab> (
inoremap ()     ()

inoremap "      ""<left>
inoremap "<tab> "
inoremap '      ''<left>
inoremap '<tab> '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tab and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap tn :tabnew

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
nmap <leader>dt :call DeleteTrailingWS()<cr>
autocmd BufWrite *.py :call DeleteTrailingWS()

" Move a line of text using ALT+[up/down]
nmap <M-down> mz:m+<cr>`z
nmap <M-up> mz:m-2<cr>`z
vmap <M-down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-up> :m'<-2<cr>`>my`<mzgv`yo`z
