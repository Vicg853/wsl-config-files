lua << EOF
vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    groups = {
      toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      items = {
        {
          name = "Tests",
          priority = 3, -- determines where it will appear relative to other groups (Optional)
          auto_close = true,
          icon = "",
          matcher = function(buf)
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
        },
        {
          name = "Misc",
          auto_close = true,  -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt') or buf.name:match('.gitignore')
          end,
          separator = { -- Optional
            style = require('bufferline.groups').separator.tab
          },
        }
      }
    },
    offsets = {
      {
        filetype = "neo-tree",
        text = "Files",
        highlight = "Directory",
        text_align = "center"
      }
    }
  },
}
EOF
