
" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'jlanzarotta/bufexplorer'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent 
set smartindent
filetype plugin indent on

" file loading
set noswapfile
set undodir=~/.vim/undodir
set undofile
set hidden
set autoread

" search
set path=.,**
set incsearch
set exrc

" theme
syntax on
"set relativenumber
set number
highlight ColorColumn ctermbg=8
set bg=dark
set splitbelow
set cc=80
"set nowrap
"set hlsearch
set nohlsearch
set laststatus=2

"env variables:
let $RC="$HOME/.config/nvim/init.vim"

" check in the current directory for tags. If not found it wil look up the
" tree until root
set tags=./tags;/

" custom shortcuts
let mapleader=" "
noremap <leader>/ :Commentary<cr>
nnoremap <leader>n :set number!<CR>
nnoremap d "_d
vnoremap d "_d
nnoremap <leader>f :FZF<CR>
nnoremap <leader>t :CHADopen<cr>
nnoremap <leader>l :ToggleBufExplorer<cr>
nnoremap <leader>r :Rg <C-R><C-W><cr>
nnoremap <leader>s /<C-R><C-W><cr>
tnoremap <Esc> <C-\><C-n>

"CHADtree settings
let g:chadtree_settings = { 'options.show_hidden': v:true, 'options.close_on_open': v:true} 

" etc
set clipboard=unnamedplus

" Plugin settings
" AnyJump
let g:any_jump_grouping_enabled = 1

"Gruvbox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" show preview window in top when ripgrepp'n
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up', 'ctrl-/'), <bang>0)
