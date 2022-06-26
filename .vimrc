"------------------------------------------------------------------------------------
"vim-plug auto setup

"-- Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"-- Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"-- Init plugin manager
call plug#begin('~/.vim/bundle')

"-- Installing plugins
"--- --- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"--- --- Dashboard-nvim
Plug 'glepnir/dashboard-nvim'
"--- --- Tokyonight
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"--- --- CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"--- --- Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"--- --- Improved terminal
Plug 'akinsho/toggleterm.nvim'
"--- --- Dev Icons
Plug 'kyazdani42/nvim-web-devicons'
"--- --- FileTree
Plug 'kyazdani42/nvim-tree.lua'
"--- --- bufferline
Plug 'akinsho/bufferline.nvim'
"--- --- WhichKey 
Plug 'folke/which-key.nvim'
"--- --- Github Copilot 
Plug 'github/copilot.vim'
"--- --- Vim-notify
Plug 'rcarriga/nvim-notify'
"--- --- smart-splits
Plug 'mrjones2014/smart-splits.nvim'
"--- --- vim-airline
Plug 'vim-airline/vim-airline'
"--- --- vim-bbye
Plug 'moll/vim-bbye'
"--- --- vim-localsearch
Plug 'mox-mox/vim-localsearch'
"--- --- vim-surround
Plug 'tpope/vim-surround'
"--- --- vim-esearch
Plug 'eugen0329/vim-esearch'
"--- --- vim-visual-multi
Plug 'mg979/vim-visual-multi'

"-- Stoping plugin manager
call plug#end()

"------------------------------------------------------------------------------------
" Dashboard-nvim config

"-- Config
let g:dashboard_default_executive ='telescope'
let g:dashboard_preview_command = 'cat'

"-- Shortcuts config


"-- Dashboard logo
let g:dashboard_custom_header=[
\'                @@@      @@%#######   @@@                   ',
\'                 @@@    @@        @@@    @@                 ',
\'                  @@@# @@        @@@   ####                 ',
\'               ### @@@@@          @@@    @@###              ',
\'         ####       @@@     @@@     @@@@@@   @@@####        ',
\'      ###                                           ###     ',
\'      ##                @@@@@@@                      ##     ',
\'      ##               @@@       #                   ##     ',
\'                      @@@       #                           ',
\'      ##              @@##     #   ##                ##     ',
\'      ##         ###  @@@@    #          ##          ##     ',
\'      ##             ##@@@@@@#@#@@@#@*##             ##     ',
\'                       @@@@@#@@@@@@@@@@                     ',
\'      ##               #@@@@@@@@@@@@@@@@             ##     ',
\'      ##              ##@@@      ##@@@ @@            ##     ',
\'      ##              ##@@@     ##@@@@    @@         ##     ',
\'       ####                                       ####      ',
\'           ###                                 ###          ',
\'                ####                     ####               ',
\'                    ###               ###                   ',
\'                        ####     ####                       ',
\'                            #####                           ',
\]


"------------------------------------------------------------------------------------
" Basic configs/setup

set encoding=utf-8
set hidden
set termguicolors
set number

"-- System clipboard
set clipboard=unnamedplus

"-- Font related configs
set guifont=JetBrainsMono\ NF:h9.3

"-- Mouse integration
set mouse=a

"-- Language servers backup fixes for coc
set nobackup
set nowritebackup

"------------------------------------------------------------------------------------
"Basic mapping 

"-- Undo/Redo
nnoremap <silent> <C-z> :undo<CR>
nnoremap <silent> <C-S>z :redo<CR>

"-- Save/save-all/save-quit   
nnoremap <silent> <C-k>s :wa<CR>
nnoremap <silent> <C-k> :w<CR>
nnoremap <silent> <C-k>q :wqall<CR>

"-- New file
nnoremap <silent> <C-n> :enew<CR>
nnoremap <silent> <C-w> :bd<CR>

"-- Copy/paste
noremap <C-v> <Esc>"+pa
noremap <C-c> "+y
cnoremap <C-v> <C-r>+
imap <C-v> <C-r>+

"-- Modes shortcuts



"------------------------------------------------------------------------------------
" Esearch configs
"-- On map
nmap <C-f> <plug>(esearch)
map <C-f>c <plug>(operator-esearch-prefill)

let g:esearch = {}

"-- Disabling default mappings
let g:esearch.default_mappings = 0

"-- Live results
let g:esearch.live_update = 1

"-- Mathes and info styling
highlight esearchMatch ctermbg=15 gui=bold ctermfg=0 guibg=White guifg=Black


"------------------------------------------------------------------------------------
" Visual Multi configs

"-- Disabling default mappings 
let g:VM_default_mappings = 0
let g:VM_maps = {}

"-- Leader 
let g:VM_learder = "<A-m>"

"-- Mappings 
  let g:VM_maps["Add Cursor Up"] = "\\<Up>"
  let g:VM_maps["Add Cursor Down"] = "\\<Down>"
  let g:VM_maps["Add Cursor At Pos"] = "\\c"
  let g:VM_maps["Visual Find"] = "\\f"
  let g:VM_maps["Search Menu"] = "\\F" 
  let g:VM_maps["Select All"] = "\\a"
  let g:VM_maps["Mouse Cursor"] = "<A-LeftMouse>"
  let g:VM_maps["Mouse Word"] = "<A-LeftMouse>w"
  let g:VM_maps["Goto Next"] = "\\}"
  let g:VM_maps["Goto Prev"] = "\\{"
  let g:VM_maps["Surround"] = "\\s"
  let g:VM_maps["Replace Pattern"] = "\\r"
  let g:VM_maps["Erase Regions"] = "\\dd"
  let g:VM_maps["Enlarge"] = "\\<Left>"
  let g:VM_maps["Shrink"] = "\\<Right>"

"------------------------------------------------------------------------------------
"Neovide config setup (installed separately: https://github.com/neovide/neovide)

let g:neovide_refresh_rate=120

let g:neovide_transparency=1

let g:neovide_no_idle=v:true

let g:neovide_remember_window_size=v:true

let g:neovide_cursor_trail_length=0.0006
let g:neovide_cursor_animation_length=0.05

let g:neovide_cursor_antialiasing=v:true

"------------------------------------------------------------------------------------
"Bufferline config

"Initial setup
lua << EOF
require('bufferline').setup{
  options = {
    mode = "buffers",
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    max_name_length = 15,
    max_prefix_length = 15,
    diagnostics = "coc",
    diagnostics_update_in_insert = true,
    offsets = {{filetype = "NvimTree", text = "Files", text_align = "left"}},
    always_show_buffer_line = true,
    show_close_icon = true,
    show_buffer_icons = true,
    color_icons = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    separator_style = "thick",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
  },
  custom_areas = {
    right = function()
      local result = {}
      local seve = vim.diagnostic.severity
      local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
      local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
      local info = #vim.diagnostic.get(0, {severity = seve.INFO})
      local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

      if error ~= 0 then
        table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
      end

      if warning ~= 0 then
        table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
      end

      if hint ~= 0 then
        table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
      end

      if info ~= 0 then
        table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
      end
      return result
    end,
  }
} 
EOF

"-- Tabs mapping (using Ctrl-w : w for workspaace, as for me, tabs look like
" mini workspaces)
nnoremap <silent> <C-w>n :tabnew<CR>
nnoremap <silent> <C-w>, :tabprevious<CR>
nnoremap <silent> <C-w>. :tabNext<CR>
nnoremap <silent> <C-w>c :tabclose<CR>

"-- Buffers mapping
nnoremap <silent> <A-_> :Bdelete<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>

"------------------------------------------------------------------------------------
" Tree sitter init
lua << EOF
local treesitter_configs = require("nvim-treesitter.configs")

if not treesitter_configs then
  return
end

treesitter_configs.setup {
  ensure_installed = {
    'typescript', 'rust', 'dockerfile',
    'graphql', 'jsdoc', 'json', 'json5',
    'python', 'regex', 'typescript',
    'vim', 'yaml', 'prisma', 'javascript',
    'html', 'http', 'dot', 'astro', 'css',
  },
  sync_install = true,
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
    -- Disabling built in regex engine
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}
EOF

"------------------------------------------------------------------------------------
"Toggle term confi

"-- Initial setup 
lua require('toggleterm').setup{}

autocmd TermEnter term://*toggleterm#*
	\ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm dir=~ "<CR>

nnoremap <silent><C-t>h <Cmd>exe v:count1 . "ToggleTerm dir=~ direction=horizontal"<CR>
inoremap <silent><C-t>h <Esc><Cmd>exe v:count1 . "ToggleTerm dir=~ direction=horizontal"<CR>


"------------------------------------------------------------------------------------
" Editor display config

set number
set numberwidth=2

set ruler

"------------------------------------------------------------------------------------
" Smart-splits config
lua << EOF
require('smart-splits').setup({
  resize_mode_quit_key = 'ESC',
})
EOF

"-- Create splits(windows) mapping 
noremap <silent> <C-r>r :SmartResizeMode<CR>
noremap <silent> <C-r>f :split<CR>
noremap <silent> <C-r>d :vsplit<CR>
noremap <silent> <C-r>c :close<CR>

"-- Move between splits(windows)
noremap <silent> <C-Up> :SmartCursorMoveUp<CR>
noremap <silent> <C-Down> :SmartCursorMoveDown<CR>
noremap <silent> <C-Left> :SmartCursorMoveLeft<CR>
noremap <silent> <C-Right> :SmartCursorMoveRight<CR>

"------------------------------------------------------------------------------------
" Theme config

"-- Config
let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

"-- Loading the colorscheme
colorscheme tokyonight

"------------------------------------------------------------------------------------
" Vim notify config
lua vim.notify = require('notify')


"------------------------------------------------------------------------------------
"Filetree config

"-- Initial required configi
let g:nvim_tree_hide_dotfiles = v:false

lua << EOF
  require'nvim-tree'.setup {
    	
  }
EOF

"-- Mappings
noremap <silent><C-b>t :NvimTreeToggle<CR>
noremap <silent><C-b>f :NvimTreeFocus<CR>
noremap <silent><C-b>s :NvimTreeFindFileToggle<CR>
noremap <silent><C-b>r :NvimTreeRefresh<CR>


"------------------------------------------------------------------------------------
" WhichKey config

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"------------------------------------------------------------------------------------
" Airline config

"-- Disabling whitespace check
let g:airline#extensions#whitespace#enabled = 0

"-- Enabling localsearch info
let g:airline#extensions#localsearch#enabled = 1

"-- coc-git extensions info 
let g:airline#extensions#hunk#coc_git = 1

"-- coc extensions info
let g:airline#extensions#coc#enabled = 1

"-- bufferlline extensions info
let g:airline#extensions#bufferline#enabled = 1

"------------------------------------------------------------------------------------
let g:copilot_filetypes = {
	\ 'xml': v:false,
	\ '.env': v:false,
	\ '.env.*': v:false,
	\ '.*': v:false,
	\ '/node_modules/*': v:false,
	\ '/dist/*': v:false,
	\ '.cargo': v:false,
	\}

"------------------------------------------------------------------------------------
" Autocompletion LSP and related

"-- CoC extensions
let g:coc_global_extensions = [
	\'coc-tsserver', 'coc-eslint', 'coc-discord-rpc',
	\'coc-tslint-plugin', 'coc-styled-components', 
	\'coc-json', 'coc-rust-analyzer', 'coc-yaml',
	\'coc-html', 'coc-css',
	\'coc-python', 'coc-git',
\]

"-- Messages display height 
set cmdheight=2

"-- Update time config
set updatetime=300

"-- Tab trigger for completion configs
inoremap <silent><expr> <C-space>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"-- Tigger completion with control space
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"-- GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-- K for doc window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"-- Symbol highlighting on cursor hold
autocmd CursorHold * silent call CocActionAsync('highlight')
