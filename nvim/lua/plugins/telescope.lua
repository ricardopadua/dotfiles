return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = " 󰍉 ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        sorting_strategy = "descending",
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            preview_width = 0.55,
          },
          width = 0.65,
          height = 0.55,
        },

        set_env = {
          COLORTERM = "truecolor",
        },

        file_ignore_patterns = {
        -- Git
        "%.git/",

        -- OS (Linux + macOS)
        "%.DS_Store",
        "Thumbs.db",
        "lost%+found/",
        "%.Trash%-",
        "%.cache/",
        "%.local/share/Trash/",
        "%.gvfs/",
        "%.fuse_hidden",

        -- Node / JS / TS
        "node_modules/",
        "dist/",
        "build/",
        "%.next/",
        "%.nuxt/",
        "%.output/",
        "coverage/",
        "%.turbo/",
        "%.vercel/",

        -- Python
        "__pycache__/",
        "%.pyc",
        "%.pyo",
        "%.pyd",
        "%.pytest_cache/",
        "%.mypy_cache/",
        "%.ruff_cache/",
        "%.tox/",
        "%.nox/",
        "%.venv/",
        "venv/",
        "env/",

        -- Rust
        "target/",

        -- Go
        "bin/",
        "pkg/",
        "%.test",

        -- .NET
        "bin/",
        "obj/",
        "%.user",
        "%.rsuser",
        "%.suo",

        -- Elixir
        "_build/",
        "deps/",
        "erl_crash.dump",

        -- Logs / temp
        "%.log",
        "%.tmp",
        "%.swp",
        "%.swo",
        "%.lock",
        },

        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },

        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
          },
        },

        preview = {
          filesize_limit = 1, -- MB
          timeout = 150,
        },
      })

      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files = {
          hidden = true,
        },

        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true,
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
      })

      opts.extensions = opts.extensions or {}
      opts.extensions.fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }

      return opts
    end,

    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
    end,
  },
}