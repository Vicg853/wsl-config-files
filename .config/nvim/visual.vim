"-- Setting up initial theme 
let g:tokyonight_style = "night"
let g:tokyonight_transparent = 1
let g:tokyonight_sidebars = ["qf", "vista_kind", "terminal", "packer"]
let g:tokyonight_dark_float = 1
let g:tokyonight_dark_sidebar = 1

colorscheme duckbones

"-- Curr line highligth
set cursorline cursorcolumn
hi CursorLine term=bold cterm=bold guibg=Grey20
hi CursorColumn term=bold cterm=bold guibg=Grey20

"-- Feline config import
source ~/.config/nvim/feline.vim
