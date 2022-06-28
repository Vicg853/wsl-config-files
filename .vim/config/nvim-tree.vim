lua << EOF
require("nvim-tree").setup({
	open_on_setup = true,
	ignore_ft_on_setup = { "Dashboard" },
	auto_reload_on_write = true,
	create_in_closed_folder = true,
	open_on_tab = true,
	sort_by = "case_sensitive",
	hijack_cursor = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true
	},
	git = {
		enable = true
	},
	view = {
		hide_root_folder = true,
		width = 25,
		height = '100%',
		side = 'left'
	},
	renderer = {
		add_trailing = true,
		icons = {
			git_placement = 'after',
			glyphs = {
				git = {
					unstaged = '',
					staged = '',
					unmerged = '',
					renamed = '',
					untracked = '',
					deleted = '',
					ignored = ''
				}
			}
		}
	},
	actions = {
		change_dir = {
			enable = true,
			global = true
		},
                open_file = {
			resize_window = false
		}
	},
	filters = {
    		dotfiles = false
  	}
})
EOF
