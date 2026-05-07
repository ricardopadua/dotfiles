-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --


-------------------------------------------------------------------------------
-- UI & COSMETICS
-------------------------------------------------------------------------------
local opt = vim.opt

opt.number         = true          -- Show line numbers
opt.cursorline     = true          -- Highlight current line (helps orientation)
opt.termguicolors  = true          -- True color support
opt.showmode       = false         -- Statusline handles this; no need for redundant text
opt.background     = "dark"        -- Optimize for dark themes
opt.title          = true          -- Sync terminal title with file name
opt.guifont        = "JetBrainsMono NF:h12" -- Recommended with Nerd Fonts
opt.colorcolumn    = "80"          -- Visual guide for line length (better than 999)
opt.signcolumn     = "yes"         -- Always show signs (prevents layout shift with LSP/Git)

-------------------------------------------------------------------------------
-- EDITOR BEHAVIOR & INDENTATION
-------------------------------------------------------------------------------
opt.smartindent    = true          -- Intelligent indentation
opt.tabstop        = 2             -- Tab width
opt.shiftwidth     = 2             -- Indent width
opt.expandtab      = true          -- Use spaces instead of tabs
opt.wrap           = true          -- Soft wrap long lines
opt.breakindent    = true          -- Wrapped lines keep indentation levels
opt.scrolloff      = 8             -- Keep 8 lines visible above/below cursor
opt.sidescrolloff  = 8             -- Keep 8 columns visible left/right of cursor

-------------------------------------------------------------------------------
-- SEARCH & COMMANDS
-------------------------------------------------------------------------------
opt.hlsearch       = false         -- No persistent highlights after search
opt.incsearch      = true          -- Visual feedback while typing search
opt.ignorecase     = true          -- Case insensitive search...
opt.smartcase      = true          -- ...unless uppercase is used
opt.inccommand     = "split"       -- Live preview of substitutions in a split window

-------------------------------------------------------------------------------
-- SYSTEM & PERSISTENCE
-------------------------------------------------------------------------------
opt.mouse          = ""           -- Full mouse support
opt.undofile       = true          -- Persistent undo (survives restarts)
opt.autoread       = true          -- Update buffer if file changes on disk
opt.updatetime     = 250           -- Faster completion and diagnostic display
opt.timeoutlen     = 300           -- Faster key combo triggering

-- File paths (Ensure folders exist: mkdir -p ~/.tmp/undo ~/.tmp/backup ~/.tmp/swp)
local tmp = vim.fn.expand("~/.tmp/")
opt.undodir        = tmp .. "undo"
opt.backupdir      = tmp .. "backup"
opt.directory      = tmp .. "swp"

-------------------------------------------------------------------------------
-- FOLDING (Code Collapsing)
-------------------------------------------------------------------------------
-- Use indentation to define folds (simple, fast, and no plugins required)
opt.foldmethod     = "indent"      
opt.foldlevel      = 99            -- Start with all folds open
opt.foldlevelstart = 99            -- Ensure folds are open when opening a file

-------------------------------------------------------------------------------
-- WINDOW SPLITS
-------------------------------------------------------------------------------
opt.splitbelow     = true          -- New horizontal splits go down
opt.splitright     = true          -- New vertical splits go right