lua << EOF
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)
  -- Visual tools
  -- -- Dashboard
  use 'glepnir/dashboard-nvim'

  -- Identation, code completion and related
  -- -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  -- -- nvim-cmp and deps
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- -- vim-vsnip + nivm-cmp 
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  
  -- Config and management
  use { "williamboman/mason.nvim" }

  -- File management

  -- Git and related

  -- Visual
  -- -- Themes
  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then

    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end 
  }
}})
EOF
