function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif


  let msgs = []

  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

lua << EOF
require('staline').setup {
	sections = {
		left = { '  ', 'cool_symbol', 'mode' },
		mid  = { vim.api.nvim_call_function("StatusDiagnostic", {}) },
		right = { { 'file_name', ' ' }, { 'StalineGit', 'branch' }, 'line_column', '▊' }
	},

	mode_colors = {
		i = "#ff9e64",
		n = "#c0caf5",
		c = "#e0af68",
		v = "#bb9af7",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}

}
EOF
