"-- Neotree explorer toggle 
nnoremap <silent> <SPACE>b :NeoTreeFloatToggle<CR>
nnoremap <silent> <SPACE>n :NeoTreeRevealToggle<CR>

"-- Moving arround windows
noremap <silent> <C-Left> <C-w>h
noremap <silent> <C-h> <C-w>h

noremap <silent> <C-Right> <C-w>l
noremap <silent> <C-l> <C-w>l

noremap <silent> <C-Up> <C-w>k
noremap <silent> <C-k> <C-w>k

noremap <silent> <C-Down> <C-w>j
noremap <silent> <C-j> <C-w>j

"-- LSP related
noremap <SPACE>c t :lua << EOF require("lsp_lines").toggle EOF<CR>

"-- Tab_ident config
nmap <silent> <C-i>1 :set expandtab tabstop=3 shiftwidth=3 softtabstop=3<CR>
nmap <silent> <C-i>2 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

command! -nargs=1 -bar CustomTabWidth :set expandtab tabstop=<args> shiftwidth=<args> softtabstop=<args>
nmap <silent> <C-i>3 :CustomTabWidth<space>
