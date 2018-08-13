"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Easier escape
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>

" Use bash profile when executing shell commands
set shell=bash\ -l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax syncing on buffer open
autocmd FileType vue,js,html,css,sh,py syntax sync fromstart


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nerdtree_tabs_open_on_console_startup=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vue_disable_pre_processors=1

function! OpenHomerun()
  execute(":normal 1\<C-w>\<C-w>\<space>src\<CR>\<CR>\<space>vue\<CR>\<CR>\<space>src\<CR>\<CR>\<space>components\<CR>\<CR>\<space>job\<CR>\<CR>\<space>feature\<CR>\<CR>\<space>modal\<CR>\<CR>\<C-w>p")
endfunction

map <leader>oh :call OpenHomerun()<CR>
if (getcwd() =~ 'Homerun$')
  autocmd VimEnter * call timer_start(200, { tid -> OpenHomerun() })
endif
  
map <leader>m mm
map <leader>r 'm
