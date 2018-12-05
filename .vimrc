execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme desert
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set wildmenu
set wildmode=longest:full,full
set undodir=$HOME/.vim/undo
set undofile
set showcmd
set clipboard=unnamedplus
set cc=80
set number
set relativenumber

" white and grey line numbers
highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=White

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

" map tabs
let mapleader = "\<Space>" 
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

" run as python code
noremap <leader>p :w !python<CR>

" open .cc/.hh
map <leader>c :vs <C-r>=expand('%:p')<CR><BS><BS>cc<CR>
map <leader>h :vs <C-r>=expand('%:p')<CR><BS><BS>hh<CR>

" open .log/.log.err
map <leader>l :vs <C-r>=expand('%:p')<CR><BS><BS><BS><BS><CR>
map <leader>e :vs <C-r>=expand('%:p')<CR>.err<CR>

" goto file with vertical split
nnoremap <C-w>f <C-w>f<C-w>L

"""""""""""
" Plugins "
"""""""""""

" AutoComplPop  ctrlp.vim  tagbar  vim-sneak  vim-surround

" AutoComplPop
let g:acp_ignorecaseOption = 1

" ctrlp
let g:ctrlp_by_filename = 1
"let g:ctrlp_regexp = 1
let g:ctrlp_clear_cache_on_exit = 0

" tagbar
nmap <F8> :TagbarToggle<CR>

" sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
