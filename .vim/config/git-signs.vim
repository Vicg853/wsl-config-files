lua << EOF
require('gitsigns').setup {
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 50,
    ignore_whitespace = true,
  }, 
  watch_gitdir = {
    interval = 500,
    follow_files = true
  },
  current_line_blame_formatter = '<author> ⍿ <author_time:%Y-%m-%d>',
}
EOF
