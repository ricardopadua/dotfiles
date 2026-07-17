return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {},
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<CR>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<CR>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<CR>", desc = "Add current buffer" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept Diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", desc = "Reject Diff" },
      { "<leader>ah", "<C-w>h", desc = "Go left window" },
      { "<leader>al", "<C-w>l", desc = "Go right window" },
    },
  },
}