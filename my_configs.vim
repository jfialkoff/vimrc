set encoding=utf-8
set number

" replacement shortcuts
function! RepCusts() range
    %s/\([Cc]\)ustomers/\1ompanies/g 
    %s/\([Cc]\)ustomer/\1ompany/g
endfunction
command Rcusts :call RepCusts()

" shortcut for Ack from project root
cnoreabbrev ag Gcd <bar> Ack!

" shortcut for ControlP
nmap <leader>t :CtrlP<cr>

" netrw config
let g:netrw_banner=0

" Set current dir to dir of current buffer
autocmd BufEnter * lcd %:p:h

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

" No indentation for HTML
au BufNewFile,BufRead *.html set textwidth=0

" YouCompleteMe configuration and shortcuts
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>ycdef :YcmCompleter GoTo<cr>


" Auto flake
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_show_quickfix=1

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

