let g:dashboard_default_executive = 'telescope'
let g:dashboard_preview_command = 'cat'
let g:dashboard_session_directory = $HOME.'/.vim/sessions'

lua << EOF
local db = require("dashboard")

db.custom_header = {
     '',
     '',
     '',
     ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
     ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
     ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
     ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
     ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
     ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',

     '',
     ''
}
db.custom_center = {
   {
		icon = '  ',
		desc = 'New File         ',
     	action ='enew!'
	},
	{	
		icon = '  ',
     	desc = 'Recent files      ',
     	action = 'lua require("telescope.builtin").oldfiles()'
	},
	{ 
      icon = '  ',
      desc = 'Load session      ',
		action = ':SessionLoad'
   },
   { 
      icon = '  ',
      desc = 'Load Last Session ',
		action = ':SessionLoad'
   },
	{
		icon = "  ",
		desc = "Update plugins   ",
		action = "PlugUpdate",
	},
	{
		icon = "  ",
		desc = "Close neovim     ",
		action = "qa!",
	},
}
EOF