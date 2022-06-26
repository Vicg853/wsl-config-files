lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '⦾', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '⦿', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '⋈', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '￬', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '≉', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  watch_gitdir = {
    interval = 500,
    follow_files = true
  },
  current_line_blame_formatter = '<author> ⍿ <author_time:%Y-%m-%d>',
}
EOF