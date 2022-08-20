set laststatus=3

lua << EOF
local icons = {
  linux = '',
  macos = '',
  windows = '',

  errs = '',
  warns = '',
  infos = '',
  hints = '',

  lsp = '',
  git = ''
}

local function diag_enable(f, s)
  return function()
    local diag = f()[s]
    return diag and diag ~= 0
  end
end

local function diag_of(f, s)
  local icon = icons[s]
  return function()
    local diag = f()[s]
    return icon .. diag
  end
end

require('feline').setup({
  force_inactive = {
    filetypes = {
      'packer',
      'neo-tree',
      'notify'
    },
    buftypes = {'terminal'},
  },
  components = {
    active = {
      {
        {
          provider = function()
            local os = vim.bo.fileformat:upper()
            local icon
            if os == 'UNIX' then
              icon = '    '
            elseif os == 'MAC' then
              icon = '    '
            else
              icon = '    '
            end
            return icon           
          end, 
          hl = function() 
            return {
              bg = require('feline.providers.vi_mode').get_mode_color(),
              fg = 'White',
              style = 'bold'
            }
          end
        },
        { 
          provider = function() 
            local mode = vim.api.nvim_get_mode()["mode"]:upper()
            return mode .. ' '
          end,
          hl = function()
            return {
                name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                bg = require('feline.providers.vi_mode').get_mode_color(),
                fg = 'White',
            }
          end,
          icon = ''
        },
        {
          provider = 'file_info',
          file_modified_icon = '✎',
          filetype_icon = true,
          hl = function() 
            return {
              name = "",
              bg = vim.o.background,
              fg = 'White'
            }
          end,
          left_sep = " ",
          right_sep = " ",
          case = 'uppercase'
        },
        {
          provider = 'git_branch',
          icon = '',
          left_sep = ' ',
          hl = {
            fg = 'White',
            style = 'bold'
          },
        },
        {
          provider = 'git_diff_added',
          hl = {
            fg = 'Green'
          }
        },
        {
          provider = 'git_diff_changed',
          hl = {
            fg = 'Orange'
          }
        },
        {
          provider = 'git_diff_removed',
          hl = {
            fg = 'Red'
          }
        }
      },
      { },
      {
        {
          provider = 'diagnostic_errors',
          right_sep = ' ', 
          left_sep = ' ',
          icon = '🚨',
          hl = {
            fg = 'Red' 
          }
        },
        {
          provider = 'diagnostic_warnings',
      	  right_sep = ' ',
	        left_sep = ' ',
          icon = '⚠',
          hl = {
            fg = 'Yellow'
          }
        },
        {
          provider = 'diagnostic_hints',
	        icon = '💡',
          left_sep = ' ',
	        right_sep = ' ',
          hl = {
            fg = 'Blue'
          }
        },
        {
          provider = 'diagnostic_info',
          icon = '🛈',
          left_sep = ' ',
          right_sep = ' ',
          hl = {
            fg = 'Cyan'
          }
        },
        {
          provider = 'lsp_client_names',
          right_sep = ' ',
          left_sep = ' ',
          icon = ' ',
          hl = {
            fg = 'White'
          }
        },
        { provider = 'scroll_bar' }
      }
    },
    inactive = { }
  }
})
EOF
