lua << EOF
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require("auto-session").setup {
  auto_session_root_dir = "~/.cache/nvim-auto-sess-save"
}

require('session-lens').setup({})
require('telescope').load_extension 'session-lens'
EOF
