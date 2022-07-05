let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko/vim-test'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" -----------------------------------------------------------------------------
" Basic Settings - Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader="\<space>"
let maplocalleader="\<space>"

syntax on
colorscheme gruvbox
set background=dark
set colorcolumn=80
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:gruvbox_contrast_dark='hard'

set hidden
set number
set relativenumber
set inccommand=split
set encoding=utf-8
set spelllang=en_us
set linebreak 

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

set ignorecase
set smartindent 
set gdefault 
set smartcase 
set signcolumn=yes
set directory=/tmp//,.

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>


" .............................................................................
" scrooloose/netrw
" .............................................................................

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END



" .............................................................................
" janko/vim-test
" .............................................................................

let test#strategy='vimterminal'

" let test#elixir#exunit#executable='docker-compose exec -e MIX_ENV=test web mix test'
let test#elixir#exunit#executable='mix test'

nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
