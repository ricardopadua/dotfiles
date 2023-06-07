-- ========================================================================== --
-- ==                         NVIM TREE                                    == --
-- ========================================================================== --

local M = {}

M.setup = function()
   local status_ok, nvim_tree = pcall(require, 'nvim-tree')
   if not status_ok then
      return
   end
   
   nvim_tree.setup({})
end

return M.setup()
