"COLORSCHEME
"colorscheme koehler

"GVIM
behave mswin            " Enable right click menu 

"SET
set noerrorbells        " No noise.
set invlist
set novisualbell  
set number
set encoding=utf8
set paste
set expandtab
set softtabstop=4
set textwidth=0
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set backspace=indent,eol,start
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set clipboard+=unnamed
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set cursorline
set spelllang=en,fr
"set tags=/home/captain_pyrat/pywebbot/base/tags
"set tags=/home/captain_pyrat/pywebbot/facebook_branch/tags
"Omnicomplete for CSS
set omnifunc=csscomplete#CompleteCSS
"Code folding
"set foldmethod=indent
"set foldlevel=99
"set foldlevel=0

"GROUP
"highlight Buy ctermbg=gray guibg=gray ctermfg=red guifg=red term=bold
"highlight Essential ctermbg=red guibg=red ctermfg=black guifg=black term=bold
"highlight Optional ctermbg=green guibg=green ctermfg=black guifg=black term=bold
"highlight Unknown ctermbg=yellow guibg=yellow ctermfg=black guifg=black term=bold
"highlight Header ctermbg=gray guibg=gray ctermfg=black guifg=black term=bold

"MATCH
"au BufWinEnter *.txt let w:m=matchadd('Essential','[!]')
"au BufWinEnter *.txt let w:m2=matchadd('Optional','[*]')
"au BufWinEnter *.txt let w:m3=matchadd("Unknown","[?]")
"au BufWinEnter *.txt let w:m4=matchadd("Buy","[$]")
"au BufWinEnter *.txt let w:m5=matchadd("Header","###")

"CPP CONFIG
au BufWinEnter *.cpp set complete-=i

"ABBREVIATION
abbreviate boit bot_id 
abbreviate right rigth

"BOOL
syntax on

"FILETYPE
filetype plugin indent on
filetype plugin on

"LET
"let Tlist_Auto_Open = 1
" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
"let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict' 

"AUTOCMD
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"REMAP
"New tab and browse
noremap to <Esc>:browse tabnew<CR>
"New tab and favex
noremap tn <Esc>:tabnew<CR>\fe
"Hide line number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR> :set nolist!<CR>
"show Nerdtree
noremap <F3> :NERDTree<CR>
"Show taglist
noremap <F4> :TlistToggle<CR>
"Close the top window
nnoremap <F5> <c-w><Up>:q!<CR>
" Reread vim config 
noremap <F6>  :source $HOME/.vimrc<CR> 
" Numbers.vim mapping
nnoremap <F7> :NumbersToggle<CR> 
"Save 
nnoremap <F8> :w<CR>
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
"Omnicompletion remap
inoremap <C-space> <C-x><C-o>
"Window Navigation remap
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

":echom "Hi Pyrat! (>^.^<) Pikachu"
