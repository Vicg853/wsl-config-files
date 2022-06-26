"Basic configs/setup

set encoding=utf-8
set hidden
set termguicolors
set number
set cmdheight=2
set updatetime=300

"-- Font related configs
set guifont=JetBrainsMono\ NF:h9.3

"-- Mouse integration
set mouse=a

"-- COC & language server fixes for coc
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=number

"Adding external configs
"source ~/.vim/config/vim-plug.vim
"source ~/.vim/config/visual.vim

"-- Initing vim-plug before other plugins to prevent issues
source ~/.vim/config/vim-plug.vim

let file_list = split(globpath('~/.vim/config/', '*.vim'), '\n')

for file in file_list
   execute 'source' fnameescape(file)
endfor