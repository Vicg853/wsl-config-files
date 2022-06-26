"Visual related configs

"-- Tokyonight setup
let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_style = "storm"

let g:tokyonight_italic_comments = 1
let g:tokyonight_transparent = 0
let g:tokyonight_dark_sidebar = 0
let g:tokyonight_italic_keywords = 0

lua vim.g.tokyonight_colors = { hint = "#91ceff", error = "#ff6b6b", warning = "#ffc085" }

set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum

"-- Initing tokyonight plus its configs
colorscheme tokyonight

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
   minimum_width = 90,
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