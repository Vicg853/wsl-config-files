"-- Setting up initial theme 
if has('termguicolors')
  set termguicolors
endif
"--let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
"--let g:sonokai_transparent_background = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

"-- Curr line highligth
set cursorline cursorcolumn
hi CursorLine term=bold cterm=bold guibg=Grey20
hi CursorColumn term=bold cterm=bold guibg=Grey20

"-- Feline config import
source ~/.config/nvim/feline.vim
