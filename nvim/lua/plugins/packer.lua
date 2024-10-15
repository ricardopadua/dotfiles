-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

local function ensure_packer()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      print('Installing packer...')
      local packer_url = 'https://github.com/wbthomason/packer.nvim'
      vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
      print('Done.')
  
      vim.cmd('packadd packer.nvim')
      return true
    end
  
    return false
  end
  
  -- You can "comment out" the line below after packer is installed
  local install_plugins = ensure_packer()
  
  require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}

    use {'nvim-lualine/lualine.nvim'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-repeat'}
    use {'phaazon/hop.nvim'}
    use {'mg979/vim-visual-multi'}
    use {'farmergreg/vim-lastplace'}
    use {'williamboman/mason.nvim'}


    use {'kyazdani42/nvim-web-devicons'}
    use {'kyazdani42/nvim-tree.lua'}

    use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-telescope/telescope-fzy-native.nvim', 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'} }}
    
    use {'mfussenegger/nvim-dap'}
    use { "rcarriga/nvim-dap-ui", requires = { {'mfussenegger/nvim-dap'} }}
    use {'jbyuki/one-small-step-for-vimkind'}

    use {'folke/lsp-colors.nvim'}

    use {'nvim-treesitter/nvim-treesitter'}
    use { "elixir-tools/elixir-tools.nvim", requires = { "nvim-lua/plenary.nvim" }}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/cmp-vsnip'}

    use {'ellisonleao/gruvbox.nvim'}

    if install_plugins then
      require('packer').sync()
    end
  end)
  
  if install_plugins then
    print '=================================='
    print '    Plugins will be installed.'
    print '      After you press Enter'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
  end
