set encoding=utf-8
set number

# netrw config
map <leader>t :Sexplore<cr>
let g:netrw_banner = 0

" Set current dir to dir of current buffer
autocmd BufEnter * lcd %:p:h

" Open NERDTree easily

" Set font size
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h14


" Folding improvements
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" Proper python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" YouCompleteMe configuration and shortcuts
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Auto flake
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

