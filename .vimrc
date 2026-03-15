set number relativenumber
set tabstop=4 shiftwidth=4 expandtab  " PEP 8 style
set autoindent smartindent
set encoding=utf-8
set colorcolumn=79                     " PEP 8 line length guide
set cursorline
set splitright splitbelow              " More natural splits

" Plugins
call plug#begin()

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " LSP-based completion
" OR lighter alternative:
" Plug 'davidhalter/jedi-vim'

" Syntax & linting
Plug 'dense-analysis/ale'              " Async linting (flake8, mypy, etc.)

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Python-specific
Plug 'vim-python/python-syntax'        " Better syntax highlighting
Plug 'Vimjas/vim-python-pep8-indent'   " Proper PEP 8 indentation

" Status line
Plug 'vim-airline/vim-airline'

" Comments
Plug 'tpope/vim-commentary'

call plug#end()

" ALE config (linting/formatting)
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_fixers  = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

" NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Better python syntax highlighting
let g:python_highlight_all = 1

