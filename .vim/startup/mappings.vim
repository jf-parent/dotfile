" https://github.com/mhinz/vim-galore#quickly-add-empty-lines
" Quickly add empty lines
" Now 5[<space> inserts 5 blank lines above the current line.
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"New tab and browse
noremap to <Esc>:browse tabnew<CR>

"New tab and favex
noremap tn <Esc>:tabnew<CR>\fe

"Hide line number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR> :set nolist!<CR>

" Reread vim config 
noremap <F3>  :source $HOME/.vimrc<CR> 

"Show taglist
noremap <F4> :TlistToggle<CR>

"Close the top window
nnoremap <F5> <c-w><Up>:q!<CR>

"show Nerdtree
noremap <F6> :NERDTreeToggle<CR>

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
noremap <c-n> :n<CR>
noremap <c-p> :previous<CR>

noremap DDF ofrom IPython import embed; embed()  # noqa<esc>

nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
