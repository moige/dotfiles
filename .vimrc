execute pathogen#infect()
execute pathogen#helptags()

set nocursorcolumn
set nocursorline
syntax sync minlines=100
set synmaxcol=200
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * :syn sync maxlines=250
set ttyfast
set lazyredraw

set number
set relativenumber
"set so=10
set hlsearch
vnoremap <C-c> "*y
nnoremap <C-t> :tabnew<cr>

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

set nocompatible
filetype plugin on

nnoremap S :%s//g<Left><Left>
vnoremap S noop
vnoremap S :s//g<Left><Left>

autocmd FileType python inoremap ;def def<space><++>(<++>):<Enter><++>
autocmd FileType python inoremap ;if if<space><++>:<Enter><++>
autocmd FileType python inoremap ;elif if<space><++>:<Enter><++><Enter>else:<Enter><++>
autocmd FileType python inoremap ;wh while<space><++>:<Enter><++>
autocmd FileType python inoremap ;frim from<space><++><space>import<space><++><Enter><++>
autocmd FileType python inoremap ;cls class<space><++>:<Enter><Enter><tab>def<space>__init__(self,<space><++>):<Enter><tab><tab><++>
autocmd FileType python inoremap ;for for<space><++><space>in<space><++>:<Enter><++>
autocmd FileType python inoremap ;was with<space><++><space>as<space><++>:<Enter><++>

"""LATEX
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<spacE><c-r>%<Enter>i
autocmd FileType tex nnoremap <F5> :!xelatex<spacE><c-r>%<Enter>
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fit \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;fig \begin{figure}<Enter><Enter>\end{figure}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex vnoremap : <ESC>`<i{\<ESC>`>2la}<ESC>?{\\<Enter>la
autocmd FileType tex inoremap {{ <Esc>F{i
autocmd FileType tex inoremap }} <Esc>f}a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i
"""END

autocmd FileType tex inoremap ;ent \gloss{}{<++>}{<++>}<Enter><++><Esc>k0f}i

"""Logical Symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
autocmd FileType tex inoremap ;gt	{\textgreater}
autocmd FileType tex inoremap ;lt	{\textless}
"""END

autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}
"autocmd FileType tex inoremap ;

"""IPA
autocmd FileType tex inoremap ;tipa \textipa{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ae {\ae}
autocmd FileType tex inoremap ;A {\textscripta}
autocmd FileType tex inoremap ;dh {\dh}
autocmd FileType tex inoremap ;yogh {\textyogh}
autocmd FileType tex inoremap ;j {\textdyoghlig}
autocmd FileType tex inoremap ;uh {\textschwa}
autocmd FileType tex inoremap ;eps {\textepsilon}
autocmd FileType tex inoremap ;gam {\textgamma}
autocmd FileType tex inoremap ;I {\textsci}
autocmd FileType tex inoremap ;sh {\textesh}
autocmd FileType tex inoremap ;th {\texttheta}
autocmd FileType tex inoremap ;Th {\textthorn}
autocmd FileType tex inoremap ;TH {\textthorn}
autocmd FileType tex inoremap ;ups {\textupsilon}
autocmd FileType tex inoremap ;ph {\textphi}
autocmd FileType tex inoremap ;om {\textomega}
autocmd FileType tex inoremap ;sig {\textsigma}
autocmd FileType tex inoremap ;oe {\oe}
autocmd FileType tex inoremap ;ng {\ng}
autocmd FileType tex inoremap ;au {\textopeno}
autocmd FileType tex inoremap ;O {\textopeno}
autocmd FileType tex inoremap ;glot {\textglotstop}
autocmd FileType tex inoremap ;ch {\textteshlig}


""".bib
autocmd FileType bib inoremap ;a @article{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>journal<Space>=<Space>"<++>",<Enter><Tab>volume<Space>=<Space>"<++>",<Enter><Tab>pages<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>booktitle<Space>=<Space>"<++>",<Enter><Tab>editor<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
"""END

let g:instant_markdown_autostart = 0

autocmd FileType markdown inoremap <F5> <esc>:!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>a
autocmd FileType markdown nnoremap <F5> :!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>

syntax on

colorscheme wal

set laststatus=2
set encoding=utf-8


let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <F5> :!w<Enter>:!pdflatex <C-r>%<Enter>
"Spell-check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

set wildmode=longest,list,full
set wildmenu

"autocmd BufWritePost *.md !pandoc <C-r>% -o <C-r>&<Backspace><Backspace>pdf && evince <C-r>%<Backspace><Backspace>pdf
"
