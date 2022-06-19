set shiftwidth=4
set tabstop=4 
set softtabstop=4 
set autoindent 
set smartindent
setlocal path=.,**
setlocal wildignore=*.pyc,*/__pycache__/

nnoremap [[ ?^class\|^\s*def<CR>
nnoremap ]] /^class\|^\s*def<CR>
