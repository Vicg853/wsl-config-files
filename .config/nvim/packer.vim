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
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

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
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Git and related

  -- Visual
  -- -- Themes
  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'joshdick/onedark.vim'
  use { 
    'mcchrish/zenbones.nvim',
    requires = "rktjmp/lush.nvim"
  }
  use 'rflban/homecolors.vim'
  use 'doki-theme/doki-theme-vim'
  use 'preservim/vim-colors-pencil'
  use 'jacoborus/tender.vim'
  -- -- Icons 
  use 'onsails/lspkind.nvim'

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
