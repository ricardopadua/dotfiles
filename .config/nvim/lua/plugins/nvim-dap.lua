-- ========================================================================== --
-- ==                               DAP                                    == --
-- ========================================================================== --
local dap = require("dap")

local M = {}

M.elixir_setup = function()
    dap.adapters.mix_task = {
        type = 'executable',
        command = '/home/padua/elixir-ls/release/debugger.sh',
        args = {}
      }

    dap.configurations.elixir = {
      {
        type = "mix_task",
        name = "mix test",
        task = 'test',
        taskArgs = {"--trace"},
        request = "launch",
        startApps = true,
        projectDir = "${workspaceFolder}",
        requireFiles = {
          "test/**/test_helper.exs",
          "test/**/*_test.exs"
        }
      },
    }
end

M.set_keymap = function()
  vim.api.nvim_set_keymap('n', '<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<F9>', [[:lua require"dap".continue()<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<F10>', [[:lua require"dap".step_over()<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<S-F10>', [[:lua require"dap".step_into()<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<F5>', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
end

return M