return {
  {
    "neovim/nvim-lspconfig",

    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")

      local root = util.root_pattern(
        "mix.exs",
        ".git"
      )(vim.fn.getcwd())

      if not root then
        return
      end

      local expert = root .. "/.expert/bin/expert"

      if vim.fn.filereadable(expert) == 0 then
        vim.notify("Installing Expert LSP...")

        vim.fn.mkdir(root .. "/.expert/bin", "p")

        local cmd = string.format(
          [[
          cd %s &&
          curl -L \
            https://github.com/elixir-lang/expert/releases/download/nightly/expert-linux-amd64 \
            -o .expert/bin/expert &&
          chmod +x .expert/bin/expert
          ]],
          vim.fn.shellescape(root)
        )

        vim.fn.system(cmd)

        if vim.v.shell_error ~= 0 then
          vim.notify(
            "Failed to install Expert LSP",
            vim.log.levels.ERROR
          )

          return
        end

        vim.notify("Expert LSP installed")
      end

      if not configs.expert then
        configs.expert = {
          default_config = {
            cmd = {
              expert,
              "--stdio",
            },

            filetypes = {
              "elixir",
              "eelixir",
              "heex",
              "surface",
            },

            root_dir = util.root_pattern(
              "mix.exs",
              ".git"
            ),

            single_file_support = true,
          },
        }
      end

      opts.servers = opts.servers or {}

      opts.servers.expert = {}

      opts.servers.elixirls = false
      opts.servers.nextls = false
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "elixir",
        "heex",
        "eelixir",
      })
    end,
  },
}