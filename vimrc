execute pathogen#infect()
set rtp+=~/.fzf

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

set laststatus=2
highlight StatusLine cterm=None ctermbg=DarkGrey ctermfg=White

" white and grey line numbers
highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=White

" jump to last position
if has("autocmd")
	:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
endif

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
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" run as python code
" noremap <leader>p :w !python<CR>

" open .cc/.hh
set wildcharm=<tab>
map <leader>c :vs <C-r>=expand('%:p')<CR><BS><BS>c<tab><CR>
map <leader>h :vs <C-r>=expand('%:p')<CR><BS><BS>h<tab><CR>

" open .log/.log.err
map <leader>l :vs <C-r>=expand('%:p')<CR><BS><BS><BS><BS><CR>
map <leader>e :vs <C-r>=expand('%:p')<CR>.err<CR>

" goto file with vertical split
nnoremap <C-w>f <C-w>f<C-w>L

" toggle line numbers
map <leader>n :set number!<CR>:set relativenumber!<CR>

"""""""""""
" Plugins "
"""""""""""

" AutoComplPop  tagbar  vim-sneak  vim-surround fzf.vim fzf-mru.vim

" AutoComplPop
let g:acp_ignorecaseOption = 0
"let g:acp_behaviorPythonOmniLength = -1

" tagbar
nmap <F8> :TagbarToggle<CR>

" sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" fzf.vim
nnoremap <leader>p :Files<CR>
nnoremap <leader>- :Files <C-r>=expand('%:h')<CR><CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>r :Rg<space>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }

" fzf-mru.vim
nnoremap <leader>m :FZFMru<CR>
