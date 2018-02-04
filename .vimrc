
set tabstop=4
set number
set relativenumber
set hlsearch
vnoremap <C-c> "*y
nnoremap <C-t> :tabnew<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

set path+=**

"""BASIC TOOLS
"Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
"For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
inoremap jw <Esc>
inoremap wj <Esc>
inoremap <C-l> <Space><Space>
"For split navigation
map <C-h> <C-w>h
let g:Ctrl_j = 'off'
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1


set nocompatible
filetype plugin on

nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

autocmd FileType python inoremap ;def def<space><++>(<++>):<Enter><++>
autocmd FileType python inoremap ;if if<space><++>:<Enter><++>
autocmd FileType python inoremap ;elif if<space><++>:<Enter><++><Enter>else:<Enter><++>
autocmd FileType python inoremap ;wh while<space><++>:<Enter><++>
autocmd FileType python inoremap ;frim from<space><++><space>import<space><++><Enter><++>
autocmd FileType python inoremap ;cls class<space><++>:<Enter><Enter><tab>def<space>__init__(self,<space><++>):<Enter><tab><tab><++>
autocmd FileType python inoremap ;for for<space><++><space>in<space><++>:<Enter><++>
autocmd FileType python inoremap ;was with<space><++><space>as<space><++>:<Enter><++>

syntax on
colorscheme codedark

set laststatus=2
set encoding=utf-8

"Spell-check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

set wildmode=longest,list,full
set wildmenu

