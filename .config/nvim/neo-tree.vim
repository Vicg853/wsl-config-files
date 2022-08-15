lua << EOF
require('neo-tree').setup({
  popup_border_style = "rounded",
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        -- This effectively hides the cursor
        vim.cmd 'hi Cursor blend=100'
	vim.cmd 'set guicursor+=a:Cursor/lCursor'
	vim.cmd 'hi CursorColumn guibg=None'
      end
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        -- Make this whatever your current Cursor highlight group is.

        vim.cmd 'hi Cursor blend=0'
	vim.cmd 'hi CursorColumn guibg=Grey20'
      end
    },
    {
      event = "file_open_requested",
      handler = function(args)
        local state = args.state
        local path = args.path
        local open_cmd = args.open_cmd or "edit"

        -- use last window if possible
        local suitable_window_found = false
        local nt = require("neo-tree")
        if nt.config.open_files_in_last_window then
          local prior_window = nt.get_prior_window()
          if prior_window > 0 then
            local success = pcall(vim.api.nvim_set_current_win, prior_window)
            if success then
              suitable_window_found = true
            end
          end
        end

        -- find a suitable window to open the file in
        if not suitable_window_found then
          if state.window.position == "right" then
            vim.cmd("wincmd t")
          else
            vim.cmd("wincmd w")
          end
        end
        local attempts = 0
        while attempts < 4 and vim.bo.filetype == "neo-tree" do
          attempts = attempts + 1

          vim.cmd("wincmd w")
        end
        if vim.bo.filetype == "neo-tree" then
          -- Neo-tree must be the only window, restore it's status as a sidebar
          local winid = vim.api.nvim_get_current_win()

          local width = require("neo-tree.utils").get_value(state, "window.width", 40)
          vim.cmd("vsplit " .. path)
          vim.api.nvim_win_set_width(winid, width)

        else
          vim.cmd(open_cmd .. " " .. path)
        end

        -- If you don't return this, it will proceed to open the file using built-in logic.
        return { handled = true }

      end
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
    window = {
      width = 25,
      popup = {
        position = { col = "100%", row = "2" },
        size = function(state)
          local root_name = vim.fn.fnamemodify(state.path, ":~")
          local root_len = string.len(root_name) + 4
          return {
            width = math.max(root_len, 50),
            height = vim.o.lines - 6
          }
        end
      },
    }
  },
  git_status = {
    window = {
      position = "float"
    }
  }
})
EOF
