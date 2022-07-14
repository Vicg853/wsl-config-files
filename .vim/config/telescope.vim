lua << EOF
require('telescope').setup {
	extensions = {
		coc = { theme = 'ivy' },
		command_palette = {
      {"File",
        { "Save file", ':w' },
        { "Quit", ':qa' },
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save all files (C-A-s)", ':wa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      },
      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "paste mode", ':set paste!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting", ':set hlsearch!' },
      },
      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      }
    }
  }
}

require('telescope').load_extension('gh')
require('telescope').load_extension('command_palette')
require('telescope').load_extension('coc')
require("telescope").load_extension("notify")
EOF
