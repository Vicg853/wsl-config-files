"Visual related configs

"-- Base configs
highlight SignColumn guibg=#00000000

"-- Tokyonight setup
source ~/.vim/config/visual/tokyonight.vim

"-- Notify configs
lua vim.notify = require("notify") 

lua << EOF
vim.notify.setup({
   background_colour = "#00000010",
   fps = 60,
   icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
   },
   level = 2,
   minimum_width = 20,
   render = "default",
   stages = "fade_in_slide_out",
   timeout = 3000
})
EOF

source ~/.vim/config/notify/shared-utils.vim
source ~/.vim/config/notify/coc.vim

lua << EOF
function coc_notify(msg, level)
  local notify_opts = { title = "LSP Message", timeout = 500 }
  vim.notify(msg, level, notify_opts)
end
EOF

"-- Staline
source ~/.vim/config/visual/staline.vim

"-- Barbar
source ~/.vim/config/visual/barbar.vim

"-- Colorizer
lua require('colorizer').setup()

"-- Ident blankline
source ~/.vim/config/visual/ident-blank-ln.vim

"-- Neovide
let g:neovide_refresh_rate=90

let g:neovide_transparency=0.87
let g:neovide_floating_blur_amount_x = 10.0
let g:neovide_floating_blur_amount_y = 10.0

let g:neovide_no_idle=v:true

let g:neovide_remember_window_size=v:true
let g:neovide_fullscreen=v:false

let g:neovide_cursor_trail_length=0.0006
let g:neovide_cursor_animation_length=0.05

let g:neovide_cursor_antialiasing=v:true
