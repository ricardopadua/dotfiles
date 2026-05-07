local function open_workspace()
  local workspace_path = vim.fn.expand("~/Development")
  
  if vim.fn.isdirectory(workspace_path) == 0 then
    vim.fn.mkdir(workspace_path, "p")
  end

  require("telescope.builtin").find_files({
    cwd = workspace_path,
    prompt_title = "Select Project",
    -- use rust to install fd and ripgrep (cargo install fd-find ripgrep)
    find_command = { "fd", "--type", "d", "--max-depth", "2", "--strip-cwd-prefix" },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        
        if selection then
          local project_path = workspace_path .. "/" .. selection[1]
          
          vim.api.nvim_set_current_dir(project_path)
          
          require("telescope.builtin").find_files()
        end
      end)
      return true
    end,
  })
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        fullscreen = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { text = "⚡ Leruaite Environment ⚡", align = "center", padding = 1, hl = "DiagnosticInfo" },
          -- { icon = "󰉋 ", title = "Projects Active", section = "projects", indent = 2, padding = 1 },
          -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          -- { section = "terminal", cmd = "date +'%A, %d de %B'", hl = "Keyword", ttl = 3600, padding = 1, align = "center" },
          -- { section = "startup" },
        },
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
            { icon = "󰚝 ", key = "p", desc = "Projects", action = open_workspace },
            -- { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files cwd=~/.config/nvim" },
            -- { icon = " ", key = "l", desc = "Plugins", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}