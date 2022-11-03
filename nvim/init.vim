" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tmsvg/pear-tree'

" Syntax highlighting extensions
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" LSP-related plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Linting
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

" Git plugin
Plug 'tpope/vim-fugitive'

" Fuzzy search in file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" THEMES AND APPEARANCES
autocmd vimenter * ++nested colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0

" PREFERENCES
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completionscoc
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
" set clipboard=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" KEYBINDINGS
nmap <C-n> :NERDTreeToggle<CR>
" <Ctrl-l> redraws the screen and removes search highlighting
nnoremap <silent> <leader>c :nohl<CR>
" Tab navigation
nnoremap tn :tabnew<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprev<CR>

" Split window navigation
nnoremap s <ESC>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sv :vsplit<CR>
nnoremap ss :split<CR>
nnoremap <leader>r <C-w>r

" Fzf configurations
nnoremap <C-p> :Files<CR> 
nnoremap <S-p> :Ag<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/venv/*     " MacOSX/Linux


" https://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set completeopt=menu,menuone,noselect

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

" Merge conflict bindings
nnoremap gh :diffget //2 <CR>
nnoremap gl :diffget //3 <CR>

:lua require('lsp') 
:lua require('linting')
:lua require('treesitter')
