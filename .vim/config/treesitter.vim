lua << EOF
local treesitter_configs = require("nvim-treesitter.configs")

if not treesitter_configs then
  return
end

treesitter_configs.setup {
  ensure_installed = {
    'typescript', 'rust', 'dockerfile',
    'graphql', 'jsdoc', 'json', 'json5',
    'python', 'regex', 'typescript',
    'vim', 'yaml', 'prisma', 'javascript',
    'html', 'http', 'dot', 'astro', 'css',
  },
  sync_install = true,
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
    -- Disabling built in regex engine
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}
EOF