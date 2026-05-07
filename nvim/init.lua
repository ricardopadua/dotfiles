
-- bootstrap lazy.nvim, LazyVim and your plugins
-- verify if your system have wl-clipboard installed
require("config.lazy")

vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.clipboard = {
  name = "wl-utils",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste",
  },
  cache_enabled = true,
}

vim.opt.clipboard = "unnamedplus"

-- 2. Check if we are over SSH
local is_ssh = os.getenv("SSH_CONNECTION") ~= nil

if is_ssh then
  -- Manually define the clipboard provider using OSC 52
  -- This bypasses the need for wl-copy/xclip
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end