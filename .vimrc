execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme eldar
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set wildmenu
set wildmode=longest:full
set undodir=$HOME/.vim/undodir
set undofile
set showcmd
set clipboard=unnamedplus
set cc=80

" split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" printf to/from fprintf
map <F2> If<Esc>wastderr, <Esc>
map <F3> 0wxwldwdw

" sudo save
cmap w!! w !sudo tee > /dev/null %

" latex spellcheck
autocmd FileType tex setlocal spell spelllang=en_us

""" Plugins
" better-whitespace
let g:strip_whitespace_on_save=1

" vim-quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-sneak
let g:sneak#label = 1

" tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

