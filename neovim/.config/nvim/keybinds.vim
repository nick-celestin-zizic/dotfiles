let mapleader = ","

" Alternate way to save
nnoremap <C-s> :w<CR>


" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> :bd<CR>

" Cycle betwen open buffers
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Code completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-space> coc#refresh

" FZF
map <leader>f :Files<CR>

" NERDTree
nnoremap <leader>n :NERDTree<CR>
