"Vimplug basic setup

"-- Install if no found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"-- Initing plug manager
call plug#begin('~/.vim/bundle')

"-- Installing visual plugins
"--- --- Tokyonight
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"--- --- Dev Icons
Plug 'kyazdani42/nvim-web-devicons'
"--- --- Notify
Plug 'rcarriga/nvim-notify'


"-- Installing LSP and related
"--- --- CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"-- Ident
"--- --- Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


"-- Copilot and helpers
"--- --- Github Copilot 
Plug 'github/copilot.vim'


"-- Git related
"-- -- Gitsigns
Plug 'lewis6991/gitsigns.nvim'


"-- Closing plug manager
call plug#end()