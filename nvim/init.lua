-- ========================================================================== --
-- ==                         IMPORT LUA MODULES                           == --
-- ========================================================================== --

require('plugins/packer')
require('plugins/nvim-tree')
require('plugins/elixirls')
require('plugins/lsp-colors')
require('plugins/telescope')
require('plugins/lualine')
require('plugins/treesitter')
require('plugins/cmp')
require('core/options')
require('core/keymaps')
require('core/api')
dap = require('plugins/nvim-dap')

-- ========================================================================== --
-- ==                               INITIALIZE                             == --
-- ========================================================================== --

dap.elixir_setup()
dap.set_keymap()




