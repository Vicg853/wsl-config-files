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
"--- --- Staline
Plug 'tamton-aquib/staline.nvim'
"--- --- Barbar
Plug 'romgrk/barbar.nvim'
"--- --- Colorizer
Plug 'norcalli/nvim-colorizer.lua'
"--- --- Blank line
Plug 'lukas-reineke/indent-blankline.nvim'
"--- --- Virt column
Plug 'lukas-reineke/virt-column.nvim'


"-- Installing LSP and related
"--- --- CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"-- Ident
"--- --- Nvim Tree (the file explorer)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


"-- Copilot and helpers
"--- --- Github Copilot 
Plug 'github/copilot.vim'


"-- File management and related
"--- --- Plenary
Plug 'nvim-lua/plenary.nvim'
"--- --- Telescope
Plug 'nvim-telescope/telescope.nvim'
"--- --- --- coc integration
Plug 'fannheyward/telescope-coc.nvim'
"--- --- --- gh cli integration
Plug 'nvim-telescope/telescope-github.nvim'
"--- --- --- command palette window
Plug 'LinArcX/telescope-command-palette.nvim'
"--- --- Dashboard
Plug 'glepnir/dashboard-nvim'
"--- --- Nvim tree
Plug 'kyazdani42/nvim-tree.lua'

"-- Productivity
"--- --- Nvim hydra
Plug 'anuvyklack/hydra.nvim'
"--- --- lexima
Plug 'cohama/lexima.vim'

"-- Git related
"-- -- Gitsigns
Plug 'lewis6991/gitsigns.nvim'


"-- Closing plug manager
call plug#end()
