"COC plugin config

"Key maps
" gf - formats selected code 
" g[ / g] - prev / next completion
" gd - GoTo def
" gt - GoTo Type def
" gi - GoTo Implementation
" gr - GoTo Reference
" grl - Codelens
" Ctrl_f / Ctrl_b - Scrolls Up/Down on floating completion windows

"Commands
":Format - formats current buffer file


"-- Adding defined plugins
source ~/.vim/config/coc/plugs.vim

"-- Completion accept config
inoremap <silent><expr> <TAB>d
   \ pumvisible() ? "\<C-n>" :
   \ CheckBackspace() ? "\<TAB>d" :
   \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"-- Completion trigger
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"-- Diagnostics navigation 
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

"-- Go to keymaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-- Highlighting on hold 
autocmd CursorHold * silent call CocActionAsync('highlight')

"-- Formatting selected code.
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)

"-- Codelens on curr line
nmap <leader>gl  <Plug>(coc-codelens-action)

"-- Floating window navigation 
if has('nvim-0.4.0') || has('patch-8.2.0750')
   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif

"-- Format buffer command
command! -nargs=0 Format :call CocActionAsync('format')