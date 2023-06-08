-- ========================================================================== --
-- ==                         ELIXIR LS                                    == --
-- ========================================================================== --
local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

local M = {}

M.sample = function()
elixir.setup {
  credo = {
    port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`
    cmd = "path/to/credo-language-server", -- path to the executable. mutually exclusive with `port`
    version = "0.1.0-rc.3", -- version of credo-language-server to install and use. defaults to 0.0.5
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  elixirls = {
    -- specify a repository and branch
    repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    cmd = "/usr/local/bin/elixir-ls.sh",

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
}
end

M.setup = function()
  elixir.setup()
end

return M.setup()