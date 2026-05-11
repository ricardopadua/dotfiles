return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
      current_line_blame_opts = { virt_text_pos = "eol", delay = 0 },
    },
    keys = {
      { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    opts = function()
      local actions = require("diffview.actions")
      return {
        enhanced_diff_hl = true,
        use_icons = false, 
        icons = { folder_closed = "", folder_open = "" }, 
        view = {
          default = { layout = "diff2_horizontal" },
          file_history = { layout = "diff2_horizontal" },
        },
        file_panel = {
          win_config = { position = "bottom", height = 10 },
        },
        file_history_panel = {
          win_config = { position = "bottom", height = 10 },
        },
        keymaps = {
          file_panel = {
            { "n", "<cr>", function() actions.select_entry(); vim.cmd("wincmd k") end },
          },
          file_history_panel = {
            { "n", "<cr>", function() actions.select_entry(); vim.cmd("wincmd k") end },
            { "n", "j", actions.next_entry },
            { "n", "k", actions.prev_entry },
            { "n", "<C-d>", "5j" },
            { "n", "<C-u>", "5k" },
          },
        },
      }
    end,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gl", "<cmd>DiffviewFileHistory %<cr>" },
      { "<leader>gx", "<cmd>DiffviewClose<cr>" },
    },
  },
}