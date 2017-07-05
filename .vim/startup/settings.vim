"GVIM
behave mswin            " Enable right click menu 

"DISABLE PYFLAKE
:let b:did_pyflakes_plugin=1

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
set backupcopy=yes
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
set foldlevel=99
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
"let g:ctags_statusline=1
" Automatically start script
"let generate_tags=1
" Displays taglist results in a vertical window:
"let Tlist_Use_Horiz_Window=0
" Various Taglist diplay config:
"let Tlist_Use_Right_Window = 1
"let Tlist_Compact_Format = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_File_Fold_Auto_Close = 1
"let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict' 
let g:user_emmet_settings = {
  \  'jsx' : {
  \    'extends' : 'html',
  \  }
  \}
let g:user_emmet_leader_key='<C-Z>'
let g:syntastic_always_populate_loc_list = 1

"AUTOCMD
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1

":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

:echom "Hi Pyrat! (>^.^<)"
:echom "Mnemonic of new commands to use"
:echom "###"
:echom "[*] reindent: gg=G"
:echom "[*] Emmet mapping <C-Z>,"
:echom "[*] Visual Block <C-v>,"
":echom "TernDef: Jump to the definition of the thing under the cursor."
":echom "TernDoc: Look up the documentation of something."
":echom "TernType: Find the type of the thing under the cursor."
":echom "TernRefs: Show all references to the variable or property under the cursor."
":echom "TernRename: Rename the variable under the cursor."
:echom "[*] Quickly edit your macros:"
:echom "    Use it like this <leader>m or \"q<leader>m."
:echom "[*] https://github.com/mhinz/vim-galore#undo-tree"
:echom "[*] gU[w,$] => Make UPPERCASE [word, end-of-line]"
:echom "[*] https://github.com/mhinz/vim-galore#folding"
:echom "###"
