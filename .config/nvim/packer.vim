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
  -- -- Terminal
  use 'voldikss/vim-floaterm'

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
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- File management and productivity
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'kazhala/close-buffers.nvim',
    config = function()
      require'close_buffers'.setup {}
    end
  }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use 'rmagatti/auto-session'
  use 'nvim-telescope/telescope.nvim'
  use { 
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  }
  use {
    'fgheng/winbar.nvim',
    requires = { "SmiteshP/nvim-gps", "nvim-treesitter/nvim-treesitter", 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('winbar').setup {
        enabled = true
      }
    end
  }

  -- Keymaps and related advanced tools
  use 'anuvyklack/hydra.nvim'

  -- Git and related
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Visual
  -- -- Themes

  use 'folke/tokyonight.nvim'
  use 'tanvirtin/monokai.nvim'
  use 'joshdick/onedark.vim'
  use { 
    'mcchrish/zenbones.nvim',

    requires = "rktjmp/lush.nvim"

  }
  use 'sainnhe/sonokai'
  -- -- LSP Related
  use 'onsails/lspkind.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()

      require("trouble").setup {

	      position = "right",

        indent_lines = true,
	      auto_preview = true,
	      signs = {
	        error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"

        },
      }
    end
  }
  -- -- Line ident related
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() 
      require'colorizer'.setup()
    end
  }

  -- -- Bottom bar
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }

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
