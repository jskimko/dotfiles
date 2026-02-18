execute pathogen#infect()
set rtp+=~/.fzf

let g:python_recommended_style = 0
filetype plugin indent on
syntax on
colorscheme elflord
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set wildmenu
set wildmode=longest,list
set undodir=$HOME/.vim/undo
set undofile
set showcmd
set clipboard=unnamedplus
set cc=80
set number
set relativenumber
set nofsync
if !isdirectory("/tmp/" . $USER)
  call mkdir("/tmp/" . $USER, "p", 0700)
endif
set directory=/tmp/$USER//
set foldmethod=marker

" white and grey line numbers
highlight StatusLine cterm=None ctermbg=DarkGrey ctermfg=White
highlight LineNr ctermfg=DarkGrey
highlight CursorLineNr ctermfg=White

" jump to last position
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                \| exe "normal! g`\"" | endif
  au BufRead,BufNewFile *.mod set syntax=ampl
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
"map <leader>l :vs <C-r>=expand('%:p')<CR><BS><BS><BS><BS><CR>
"map <leader>e :vs <C-r>=expand('%:p')<CR>.err<CR>

" goto file with vertical split
nnoremap <C-w>f <C-w>f<C-w>L

" toggle line numbers
map <leader>n :set number!<CR>:set relativenumber!<CR>

" toggle wrap
map <leader>w :set wrap!<CR>

"""""""""""
" Plugins "
"""""""""""

" AutoComplPop
let g:acp_ignorecaseOption = 0
"let g:acp_behaviorPythonOmniLength = -1
let g:acp_enableAtStartup = 1

"" ale
""set omnifunc=ale#completion#OmniFunc
""set completeopt=menu,menuone,noinsert,noselect
""let g:ale_completion_enabled = 0
"set signcolumn=number
"nnoremap K :ALEHover<CR>
"nnoremap <leader>ai :ALEInfo<CR>
"nnoremap <leader>at :ALEToggle<CR>
"nnoremap <leader>ab :ALEToggleBuffer<CR>
"nnoremap <leader>gn :ALENext<CR>
"nnoremap <leader>gp :ALEPrevious<CR>
"nnoremap <leader>gd :ALEGoToDefinition<CR>
"nnoremap <leader>gt :ALEGoToTypeDefinition<CR>
"nnoremap <leader>gi :ALEGoToImplementation<CR>
"nnoremap <leader>gr :ALEFindReferences<CR>
"nnoremap <leader>gs :ALESymbolSearch<space>
"let g:ale_hover_cursor = 0
"
"let g:ale_linters = {
"\ "python": ["pyright"],
"\ "cpp": ["clangd"],
"\}
"
""let g:ale_fixers = {
""\ '*': ['remove_trailing_lines', 'trim_whitespace'],
""\}

" onedark + lightline
let g:onedark_color_overrides = {
\ "black":          { "gui": "#000000", "cterm": "0", "cterm16": "0" },
\ "background":     { "gui": "#000000", "cterm": "0", "cterm16": "NONE" },
\ "white":          { "gui": "#D0D0D0", "cterm": "252", "cterm16": "15" },
\ "foreground":     { "gui": "#D0D0D0", "cterm": "252", "cterm16": "NONE" },
\ "comment_grey":   { "gui": "#6C6C6C", "cterm": "244", "cterm16": "7" },
\ "vertsplit":      { "gui": "#6C6C6C", "cterm": "244", "cterm16": "7" },
\ "special_grey":   { "gui": "#6C6C6C", "cterm": "244", "cterm16": "7" },
\ "gutter_fg_grey": { "gui": "#444444", "cterm": "240", "cterm16": "8" },
\ "visual_grey":    { "gui": "#444444", "cterm": "240", "cterm16": "8" },
\ "menu_grey":      { "gui": "#303030", "cterm": "236", "cterm16": "8" },
\ "cursor_grey":    { "gui": "#303030", "cterm": "236", "cterm16": "8" },
\}
colorscheme onedark

highlight Title        ctermfg=none
highlight TabLineSel   ctermfg=236 ctermbg=252
highlight TabLine      ctermfg=252 ctermbg=240
highlight TabLineFill  ctermfg=252 ctermbg=236
highlight StatusLine   ctermfg=252 ctermbg=236
highlight StatusLineNC ctermfg=244 ctermbg=235

let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'active': { 'left': [['mode', 'paste'], ['readonly', 'filename' ]], },
\ 'component_function': { 'filename': 'LightlineFilename', },
\}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

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
nnoremap <leader>t :Tags<CR>
nnoremap <leader>r :Rg<space>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }

" fzf-mru.vim
nnoremap <leader>m :FZFMru<CR>
