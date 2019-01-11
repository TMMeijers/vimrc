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

" Paste system clipboard in paste mode
function! PasteSystemClipboard()
  set paste
  silent execute "normal \"*p"
  set nopaste
endfunction

" System clipboard copy pasting
vnoremap <C-y> "*y
nnoremap <silent> <C-p> :call PasteSystemClipboard()<CR>

" Splits
set splitbelow
set splitright

map <leader>sk :leftabove new<CR>
map <leader>sl :rightbelow vnew<CR>
map <leader>sj :rightbelow new<CR>
map <leader>sh :leftabove vnew<CR>


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

function! OpenTests()
  execute(":normal 1\<C-w>\<C-w>gg\<space>__tests__\<CR>\<CR>\<space>components\<CR>\<CR>")
endfunction

function! OpenHomerun()
  execute(":normal 1\<C-w>\<C-w>gg\<space>src\<CR>\<CR>\<space>vue\<CR>\<CR>\<space>src\<CR>\<CR>\<space>components\<CR>\<CR>")
endfunction

map <leader>ot :call OpenTests()<CR>

map <leader>oh :call OpenHomerun()<CR>
if (getcwd() =~ 'Homerun$')
  autocmd VimEnter * call timer_start(200, { tid -> OpenHomerun() })
endif
  
map <leader>m mm
map <leader>r 'm

