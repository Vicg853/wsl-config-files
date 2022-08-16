lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function (server_name)    
    require("lspconfig")[server_name].setup {
      capabilities = capabilities
    }
  end
})
EOF
