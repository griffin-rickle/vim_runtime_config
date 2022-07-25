set clipboard+=unnamed
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set cursorline
set cursorcolumn

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap jj <ESC>
let mapleader="\\"

source ~/git/vim-sparql/syntax/sparql.vim
source ~/git/vim-sparql/ftdetect/sparql.vim
source ~/git/vim-rdf/syntax/trig.vim
source ~/git/vim-rdf/syntax/jsonld.vim
source ~/git/vim-rdf/syntax/n3.vim
source ~/git/vim-rdf/syntax/turtle.vim

let g:NERDTreeWinPos = "left"
autocmd VimEnter * NERDTree
set nofoldenable

let g:vimspector_base_dir=expand( '$HOME/.vim_runtime/my_plugins/vimspector' )
let g:vimsppector_install_gadgets = [ 'vscode-node-debug2' ]

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

nmap <Leader>p <Nop>

let g:ale_linters = {
    \   'python': ['flake8', 'plint'],
    \}

let g:pymode_options_max_line_length = 120 
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
colo slate
