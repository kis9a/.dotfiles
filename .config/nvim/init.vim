lua require 'init'

" --- setting ---
" set number relativenumber
" set encoding=UTF-8
" set hidden
" set background=dark
" set cursorline
" set autoindent
" set autochdir
" set tabstop=2
" set showtabline=2
" set shiftwidth=2
" set timeoutlen=1000
" set ttimeoutlen=0
" set termguicolors
" set expandtab
" set splitright
" set clipboard=unnamed
" set clipboard+=unnamedplus
" set tags=./tags;$HOME
" set noswapfile
" set laststatus=2
" set nobackup
" set modifiable
" set regexpengine=1
" set lazyredraw
" set noshowcmd
" set ignorecase
" set smartcase
" set noshowmode
" set noruler
" set noerrorbells
" set novisualbell
" set shada="NONE"
" set viminfo="NONE"
" set switchbuf+=newtab
" let mapleader="\<Space>"
" let maplocalleader="\,"
" let g:netrw_browsex_viewer="open"
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
" let g:loaded_netrwSettings = 1
" let g:loaded_netrwFileHandlers  = 1
" let g:loaded_gzip = 1
" let g:loaded_tar = 1
" let g:loaded_tarPlugin = 1
" let g:loaded_zip = 1
" let g:loaded_zipPlugin = 1
" let g:loaded_rrhelper = 1
" let g:loaded_2html_plugin = 1
" let g:loaded_vimball = 1
" let g:loaded_vimballPlugin = 1
" let g:loaded_getscript = 1
" let g:loaded_getscriptPlugin = 1

" --- plugins ---
source ~/.config/nvim/plugins.vim

" --- color setting ---
colorscheme gruvbox

" --- 0 keymapping ---
" nnoremap
nnoremap x "_x
nnoremap s "_s
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G''
nnoremap <C-]> g<C-]>zz
nnoremap <C-]> <ESC>g<C-]>
nnoremap g- :sp<CR>
nnoremap g\ :vsp<CR>
nnoremap <Leader>rl :so %<CR>
nnoremap <C-c> :bd<cr>
nnoremap <C-q> :q!<cr>
nnoremap <C-s> :w<cr>
nnoremap z0 zt
nnoremap n nzz
nnoremap N Nzz
nnoremap ; :
nnoremap : ;
nnoremap <C-j><C-j> <C-W>\| <C-W>_
nnoremap <C-j><C-k> <C-w>=
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
nnoremap su :let @+ = expand("%:p")<cr>
nnoremap <Leader>j :tabnew<CR>:e $TASK<CR>
nnoremap <Leader>d :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <Leader>b :tabnew<CR>:e $BOOKMARKS<CR>
"" vimtab
nnoremap g1 1gt
nnoremap g2 2gt
nnoremap g3 3gt
nnoremap g4 4gt
nnoremap g5 5gt
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-w>d :tabclose<CR>
nnoremap <C-w>n :tab split<CR>
" inoremap
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-s> <Esc>:w<cr>
inoremap <C-x> <End><CR>
inoremap <C-o> <Home><CR><Up>
inoremap <C-b> <Esc>bi
inoremap <C-e> <Esc>ea
inoremap <C-d> <BS>
inoremap <C-c> <DEL>
" vnoremap
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
vnoremap gc :Commentary<CR>
" cnoremap
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <BS>
cnoremap <C-c> <Del>

"  --- vimquickfix ---
function! ToggleQuickfix()
  let l:nr = winnr('$')
  cwindow
  let l:nr2 = winnr('$')
  if l:nr == l:nr2
    cclose
  endif
endfunction
nnoremap <script> <silent> <Leader>q :call ToggleQuickfix()<CR>

" --- commands ---
if $TMUX != ""
  augroup titlesettings
    autocmd!
    autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
    autocmd VimLeave * call system("tmux rename-window zsh")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
  augroup END
endif
command! RemoveTrairing :%s/\s\+$//e
command! M :SignatureListGlobalMarks
match errorMsg /\s\+$/

" --- tabline ---
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s= '%#TabLineSel#< %{getcwd()} > '
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = title
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ': ' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" --- statusline ---
let &statusline=':['.'%!buffer('%')'.']'.' < %F >'
