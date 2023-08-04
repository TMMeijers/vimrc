"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show relative line numbers
set number relativenumber

" Only toggle the relative line numbers for buffers that are not NERD Tree
fun! SetRelativeNumber()
  if (bufname("%") !~ "NERD_Tree_")
    set relativenumber
  endif 
endfun
fun! SetNoRelativeNumber()
  if (bufname("%") !~ "NERD_Tree_")
    set norelativenumber
  endif 
endfun

" Toggle relative number off when not focusing buffer
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * call SetRelativeNumber()
  autocmd BufLeave,FocusLost,InsertEnter   * call SetNoRelativeNumber()
augroup END

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

map <leader>sk :leftabove new<CR>
map <leader>sl :rightbelow vnew<CR>
map <leader>sj :rightbelow new<CR>
map <leader>sh :leftabove vnew<CR>

" Let Y behave like C & D
map Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax syncing on buffer open
autocmd FileType vue,js,html,css,sh,py syntax sync fromstart

" Recognize .env.NAME files
augroup filetypedetect
    au! BufRead,BufNewFile *.env.* setfiletype sh
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>m mm
map <leader>r 'm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Obsession
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create a vim session at current directory if not present
function! ObsessIfNoSession()
  if (!filereadable(getcwd() . "/Session.vim"))
    Obsess
  endif
endfunction
autocmd VimEnter * call ObsessIfNoSession()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Blade
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix blade auto-indent
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade 
