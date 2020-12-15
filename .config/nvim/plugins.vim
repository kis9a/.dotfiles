" --- vim-plug autoload ---
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" --- vim-plug plugins ---
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Rg', 'Buffers', 'Maps', 'Marks' ] }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " git
  Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
  Plug 'tpope/vim-fugitive', { 'on': ['G', 'Gstatus', 'Git'] }
  Plug 'jreybert/vimagit', { 'on': 'Magit' }

  " window
  Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }

  " move
  Plug 'unblevable/quick-scope'

  " edit
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'tsx', 'vue', 'markdown'] }
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

  " utiles
  Plug 'kshenoy/vim-signature'
  Plug 'stefandtw/quickfix-reflector.vim', { 'for': 'qf' }
  Plug 'voldikss/vim-translator', { 'on': [ 'Translate', 'TranslateV', 'TranslateW', 'TranslateWV' ] }
  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-rooter'
  Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
  Plug 't9md/vim-quickhl'
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion-s)' }

  " color
  Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
  Plug 'cocopon/colorswatch.vim', { 'on': 'ColorSwatchGenerate' }

  " markdown/documentation
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
  Plug 'aklt/plantuml-syntax', { 'for': 'uml' }
  Plug 'scrooloose/vim-slumlord', { 'for': 'uml' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " javascript/typescript
  " Plug 'yuezk/vim-js', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  " Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  " Plug 'posva/vim-vue', { 'for': 'vue' }
  " Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  " Plug 'leafgarland/typescript-vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  " Plug 'othree/yajs.vim', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  " Plug 'HerringtonDarkholme/yats.vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }

  " golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

  " rust
  Plug 'rust-lang/rust.vim', { 'for': 'rust'}

  " data
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'jparise/vim-graphql', { 'for': 'graphql' }
  Plug 'towolf/vim-helm', { 'for': 'helm' }

  " vim
  Plug 'tbastos/vim-lua', { 'for': 'lua' }

  " clang
  Plug 'justmao945/vim-clang', { 'for': 'c' }
call plug#end()

" --- pluggin highlight ----
highlight QuickScopePrimary guifg='#fb4934' gui=underline ctermfg=167 cterm=underline
highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=108 cterm=underline
highlight CocExplorerNormalFloat ctermbg=black
highlight CocExplorerNormalFloatBorder ctermbg=black guifg=black

" --- function ---
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" --- plugin mapping
nnoremap <silent> ge :WinResizerStartResize<CR>
nnoremap <silent>gr :Grepper<CR>
nnoremap <silent>gc :Grepper-cd 
nnoremap <silent>gm :SignatureListGlobalMarks<CR>
nnoremap <silent>ga :Magit<CR>
nnoremap <silent><C-p> :GFiles!<CR>
nnoremap <silent>sp :Commands!<CR>
nnoremap <silent>sf :Files!<CR>
nnoremap <silent>sm :Marks!<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers!<CR>
nnoremap <silent>sl :Lines!<CR>
nnoremap <silent>sc :Commits!<CR>
nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>sn :CocCommand explorer --sources=buffer+,file+ --width=60<CR>
nnoremap <silent><C-n> :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width=400 --floating-height=200<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>su :UndotreeToggle<CR>
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap sr <Plug>(coc-rename)
nmap sk <Plug>(coc-format)
vnoremap gc :Commentary<CR>
nnorema <Leader>gn :Gina 
nmap <Leader>h <Plug>(quickhl-manual-this)
xmap <Leader>h <Plug>(quickhl-manual-this)
nmap <Leader>H <Plug>(quickhl-manual-reset)
xmap <Leader>H <Plug>(quickhl-manual-reset)
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
nmap <LocalLeader> <Leader><Leader>s

" ---- plugin valiables
let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 50
let g:undotree_DiffpanelHeight = 10
let g:winresizer_start_key = '<Leader>e'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.vue,*,tsx"
let g:mkdp_echo_preview_url = 1
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:qf_modifiable = 1
let g:qf_write_changes = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:translator_target_lang='ja'
let g:UltiSnipsExpandTrigger="<tab>"
let g:vim_jsx_pretty_colorful_config = 1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.4 } }
let g:fzf_buffers_jump = 1
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:coc_global_extensions = [
      \  'coc-git'
      \, 'coc-pairs'
      \, 'coc-explorer'
      \, 'coc-highlight'
      \, 'coc-snippets'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-json'
      \, 'coc-toml'
      \, 'coc-yaml'
      \, 'coc-markdownlint'
      \, 'coc-go'
      \, 'coc-tsserver'
      \, ]
