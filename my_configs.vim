" Open NERDTree easily
nmap <leader>t :NERDTree<cr>


" Easy editing and reloading of vimrc
map <leader>vimrc :o ~/.vim_runtime/my_configs.vim<cr>
autocmd bufwritepost my_configs.vim source $MYVIMRC

" Set font size
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h14
