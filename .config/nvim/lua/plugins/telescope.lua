local M = {}
local actions = require("telescope.actions")
local telescope = require("telescope")

function M.setup()
  telescope.setup({
    defaults = {
      file_ignore_patterns = {
        "_build",
        "deps",
        "vendor",
        "node_modules",
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
      set_env = { ["COLORTERM"] = "truecolor" },
      prompt_prefix = "🔍 ",
      selection_caret = "> ",
      entry_prefix = "  ",
      sorting_strategy = "ascending",
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-q>"] = actions.send_to_qflist,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
    pickers = {
      -- Your special builtin config goes in here
      buffers = {
        sort_lastused = true,
        -- theme = "dropdown",
        -- previewer = false,
        mappings = {
          i = {
            ["<c-d>"] = actions.delete_buffer,
          },
          n = {
            ["<c-d>"] = actions.delete_buffer,
          },
        },
      },
    },
  })
end

return M.setup()
