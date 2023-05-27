local M = {}
local treesitter = require("nvim-treesitter.configs")

function M.setup()
  treesitter.setup({
  ensure_installed = {"elixir", "heex", "eex"},
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
})

end

return M.setup()
