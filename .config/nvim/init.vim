" --- setting --- {{{
set number relativenumber
set encoding=UTF-8
set synmaxcol=200
set redrawtime=10000
set hidden
set background=dark
set cursorline
set autoindent
set autochdir
set tabstop=2
set showtabline=2
set shiftwidth=2
set timeoutlen=1000
set ttimeoutlen=0
set signcolumn=yes
set updatetime=300
set shortmess+=c
set modifiable
set expandtab
set splitright
set clipboard=unnamed
set clipboard+=unnamedplus
set noswapfile
set laststatus=2
set nobackup
set regexpengine=1
set lazyredraw
set noshowcmd
set ignorecase
set smartcase
set noshowmode
set noruler
set spelllang=en_us
set foldmethod=marker
set tabpagemax=100
" set shell=zsh\ -i
set termguicolors
set noerrorbells
set novisualbell
set viminfo="NONE"
set switchbuf+=newtab
set virtualedit=block
let mapleader="\<Space>"
let maplocalleader="\,"
let g:netrw_browsex_viewer="open"
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
"}}}

"  --- plugins --- {{{
source ~/.config/nvim/plugins.vim
"}}}

" --- color setting --- {{{
if exists("&termguicolors") && exists("&winblend")
  let g:neosolarized_termtrans=1
  runtime ./colors/gruvbox.vim
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif
"}}}

" --- nnoremap --- {{{
nnoremap x "_x
nnoremap s "_s
nnoremap <CR> A<CR><ESC>
nnoremap == gg=G''
nnoremap <C-]> g<C-]>zz
nnoremap <C-]> <ESC>g<C-]>
nnoremap ss :sp<CR>
nnoremap sv :vsp<CR>
nnoremap <Leader>rl :so ~/.config/nvim/init.vim<CR>
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
nnoremap <silent> <Leader>o :call ToggleSpellCheck()<CR>
nnoremap <silent> cy ce<C-r>0<ESC>:let @/=@1<CR>:noh<CR>
nnoremap gF <C-w>gF
nnoremap <c-t> [s1z=<c-o>" 
" }}}

" --- inoremap --- {{{
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
inoremap <C-w> <C-\><C-o>db
inoremap <C-r> <C-\><C-o>de
inoremap <C-i>s <Esc>[s1z=`]a
inoremap <C-i>i <Esc>I
inoremap <C-i>a <Esc>A
inoremap <C-i>d <Esc>dd<BS>A
inoremap <C-i>h <Esc>HI
inoremap <C-i>l <Esc>LI
inoremap <C-i>m <Esc>MI
inoremap <C-i>p <Esc>pi
inoremap <C-i>y <Esc>yyi
inoremap <C-i>w <Esc>diwi
inoremap <C-i>y <Esc>yyi
inoremap <C-i>w <Esc>diwi
inoremap <C-i>u <Esc>ui"}}}

" --- vnoremap --- {{{
vnoremap ; :
vnoremap : ;
vnoremap > >gv
vnoremap < <gv
vnoremap y ygv
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]
vnoremap <Leader>r y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <Leader>/ "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
vnoremap gc :Commentary<CR>
vnoremap <Leader>i :'<,'>!tail -r<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let @/=@1<CR>:noh<CR>"
" }}}

" --- cnoremap --- {{{
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <BS>
cnoremap <C-c> <Del>
"}}}

" --- command ---{{{
command! Rmt :%s/\s\+$//e
command! M :SignatureListGlobalMarks
match errorMsg /\s\+$/
"}}}

" --- tabline --- {{{
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s='%#TabLineDir#< %{getcwd()} > '
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = title
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

nnoremap ,1 1gt
nnoremap ,2 2gt
nnoremap ,3 3gt
nnoremap ,4 4gt
nnoremap ,5 5gt
nnoremap ,6 3gt
nnoremap ,7 4gt
nnoremap ,8 5gt
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-w>d :tabclose<CR>
nnoremap <C-w>n :tab split<CR>
nnoremap <C-w>c :tabnew<CR>
"}}}

" --- statusline --- {{{
let &statusline=':%n %f %q %y'
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <silent> <Leader>s :call ToggleHiddenAll()<CR>
"}}}

" --- spell check --- {{{
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
"}}}

"  --- vimquickfix window --- {{{
function! ToggleQuickfix()
  let l:nr = winnr('$')
  cwindow
  let l:nr2 = winnr('$')
  if l:nr == l:nr2
    cclose
  endif
endfunction
nnoremap <script> <silent> <Leader>q :call ToggleQuickfix()<CR>
"}}}

" --- tmux entry --- {{{
if $TMUX != ""
  augroup titlesettings
    autocmd!
    " autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
    autocmd VimEnter * call system("tmux rename-window " . "'[vim] " . fnamemodify(getcwd(), ':t') . "'")
    autocmd VimLeave * call system("tmux rename-window zsh")
  augroup END
endif
"}}}

" --- coc-explorer entry --- {{{
"augroup MyCocExplorer
"  autocmd!
"  autocmd VimEnter * sil! au! F
"  " set window status line
"  autocmd FileType coc-explorer setl statusline=File-Explorer
"  "quit explorer whein it's the last
"  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"  " Make sure nothing opened in coc-explorer buffer
"  autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif
"  " open if directory specified or if buffer empty
"  autocmd VimEnter * let d = expand('%:p')
"    \ | if argc() == 0
"      \ | exe 'CocCommand explorer --quit-on-open --position floating --floating-width=10000 --floating-height=10000 --sources buffer+,file+'
"    \ | elseif isdirectory(d) || (bufname()=='')
"      \ | silent! bd
"      \ | exe 'CocCommand explorer --quit-on-open --position floating --floating-width=10000 --floating-height=10000 --sources buffer+,file+ ' . d
"      \ | exe 'cd ' . d
"    \ | else
"      \ | cd %:p:h
"    \ | endif
"  " cd after open
"  autocmd User CocExplorerOpenPost let dir = getcwd() | call CocActionAsync("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
"augroup END
" }}}
