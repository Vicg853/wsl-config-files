"-- Barbar (buffer management)
"Previous buffer
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
"Next buffer
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
"Close current buffer
nnoremap <silent>    <A-_> <Cmd>BufferClose<CR>

"-- Screen splitting, resizing and navigation
"Smart resize with hydra
lua << EOF
local Hydra = require('hydra')

local hint = [[
  ^			    Window manager Hydra 			   ^
  ^
  ^									   ^
  ^ 		   _h_ Horizontal split  _v_ Vertical split 		   ^
  ^^		        _c_ Closes the current window                      ^
  ^
  ^  _<A-->_ Decreases vertical size    _<A-+>_ Increases vertical size    ^
  ^ _-_   Descreases horizontal size  ^  _+_   Increases horizontal size   ^
  ^									   ^
]]

Hydra({
	name = 'Screen manage mode',
	mode = 'n',
	body = '<C-w>',
	config = {
		on_enter = vim.notify('Entering screen Hydra', 'info', { title = 'Hydra' }),
		invoke_on_body = true,
		hint = {
			position = 'middle',
			border = 'rounded'
		},
		timeout = false,
	},
	hint = hint,
	heads = {
		{ 'c', '<Cmd>:q<CR>' },
		{ 'h', '<Cmd>:split<CR>' },
		{ 'v', '<Cmd>:vsplit<CR>' },
		{ '<A-->', '<Cmd>:vertical resize -2<CR>', { private = true } },
		{ '<A-+>', '<Cmd>:vertical resize +2<CR>', { private = true } },
		{ '-', '<Cmd>:resize -2<CR>', { private = true } },
		{ '+', '<Cmd>:resize +2<CR>', { private = true } }
	}
})
EOF

"Move to the left
noremap <silent> <C-Left>  <C-w>h
nnoremap <silent> <C-h>  <C-w>h
"Move to the right
nnoremap <silent> <C-Right> <C-w>l
nnoremap <silent> <C-l> <C-w>l
"Move to the top
nnoremap <silent> <C-Up>    <C-w>k
nnoremap <silent> <C-k>    <C-w>k
"Move to the bottom
nnoremap <silent> <C-Down>  <C-w>j
nnoremap <silent> <C-j>    <C-w>j

"-- File 
"Save current buffer
nnoremap <silent> <C-k>s <Cmd>w<CR>
"Save all buffers
nnoremap <silent> <C-k>S <Cmd>wa<CR>
"Save all buffers and quit
nnoremap <silent> <C-k>q <Cmd>wqall<CR>
"Quit without saving
nnoremap <silent> <C-k>d <Cmd>quit<CR>
"Save session
nnoremap <silent> <C-s>s :SessionSave<space>

"Nvim-tree (file tree)
"Toggle
nnoremap <silent> <C-b>t <Cmd>NvimTreeToggle<CR>
"Focus 
nnoremap <silent> <C-b>f <Cmd>NvimTreeFocus<CR>
"New file
"Built in when focused: a
"Delete file
"Built in when focused: d
"Find file
"Built in when focused: f
"New directory
"
"Refresh tree
"Built in when focused: Shift-r
"

"-- Ident
nmap <silent> <C-i>1 :set expandtab tabstop=3 shiftwidth=3 softtabstop=3<CR>
nmap <silent> <C-i>2 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

"-- Github copilot
imap <silent><script><expr> <C-d>g copilot#Accept("\<CR>")

"-- Telescope
noremap <silent> <C-p> <Cmd>:Telescope command_palette<CR>
