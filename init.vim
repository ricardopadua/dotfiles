let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
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

set ignorecase
set smartindent 
set gdefault 
set smartcase 
set signcolumn=yes
set directory=~/tmp,/var/tmp,/tmp

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>


" .............................................................................
" scrooloose/nerdtree
" .............................................................................
nnoremap <C-n> :NERDTree<CR>

" Open nerdtree window on opening Vim
autocmd VimEnter * NERDTree

" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

"Close nerdtree automatically if it is theonly window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif