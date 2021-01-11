" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Status
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Code Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Clear highlight after search
    Plug 'haya14busa/is.vim'
    " Better terminal
    Plug 'kassio/neoterm'
    " Haskell Error Checking
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    " Haskell
    Plug 'neovimhaskell/haskell-vim'
    " Odin
    Plug 'Tetralux/odin'
    " Plug 'dense-analysis/ale'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Terminal
let g:neoterm_default_mod = ':botright'
let g:neoterm_keep_term_open = 0
let g:neoterm_autoinsert = 1
let g:neoterm_use_relative_path = 1
let g:neoterm_command_prefix = 'clear;'
let g:neoterm_size = 10

" Airline Settings
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep           = ' '
let g:airline_left_alt_sep       = '|'
let g:airline_right_sep          = ' '
let g:airline_right_alt_sep      = '|'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'
