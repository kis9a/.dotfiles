" --- vim-plug install --- {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
"}}}

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'on': [ 'Files', 'GFiles', 'Commands', 'Commits', 'Rg', 'Buffers', 'Maps', 'Marks' ] }
" junegunn/fzf {{{
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent>gdi :Gdiffsplit@<CR>
nnoremap <silent>sp :Commands<CR>
nnoremap <silent>sf :Files<CR>
nnoremap <silent>sm :Marks<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers<CR>
nnoremap <silent>sl :Lines<CR>
nnoremap <silent>sc :Commits<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.6 } }
let g:fzf_buffers_jump = 1
"}}}
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" neoclide/coc.nvim {{{
let g:coc_global_extensions = [
      \  'coc-git'
      \, 'coc-pairs'
      \, 'coc-emoji'
      \, 'coc-prettier'
      \, 'coc-eslint'
      \, 'coc-explorer'
      \, 'coc-highlight'
      \, 'coc-snippets'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-json'
      \, 'coc-toml'
      \, 'coc-yaml'
      \, 'coc-go'
      \, 'coc-vimlsp'
      \, 'coc-tsserver'
      \, 'coc-vetur'
      \, 'coc-markdownlint'
      \, 'coc-react-refactor'
      \, ]

nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>sn :CocCommand explorer --sources=buffer+,file+ --width=55<CR>
nnoremap <silent><C-n> :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width=10000 --floating-height=10000<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>su :UndotreeToggle<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap sr <Plug>(coc-rename)
nmap sk <Plug>(coc-format)

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"}}}
Plug 'dense-analysis/ale', { 'on': [ 'ALEEnable', 'ALEEnableBuffer' ] }
" dense-analysis/ale {{{
" let g:ale_sign_info = ''
" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
" let g:ale_sign_priority = 4
" let g:ale_open_list = 0
" let g:ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
" let g:ale_echo_msg_info_str = ''
" let g:ale_echo_msg_error_str = ''
" let g:ale_echo_msg_warning_str = ''
" let g:ale_writegood_options = '--no-passive'
" let g:ale_virtualtext_cursor = 1
" let g:ale_virtualtext_prefix = ' '

" let g:ale_linters = {
"   \   'asciidoc': ['vale'],
"   \   'markdown': ['markdownlint', 'vale'],
"   \   'dockerfile': ['dockerfile_lint'],
"   \   'go': ['gofmt', 'golint', 'go vet', 'golangserver'],
"   \   'plaintex': ['proselint', 'chktex', 'lacheck'],
"   \   'help': [],
"   \   'python': ['flake8', 'pylint', 'pyright'],
"   \   'ruby': ['solargraph', 'rubocop', 'ruby'],
"   \   'groovy': ['android'],
"   \   'xml': ['android'],
"   \   'javascript': ['eslint'],
"   \   'text': ['proselint', 'write-good'],
"   \   'vim': ['vint'],
"   \   'yaml': ['yamllint'],
"   \   'mail': ['proselint', 'write-good']
" \}

" function ALELSPMappings()
"   for linter in ale#linter#Get(&filetype)
"     if !empty(linter.lsp) && ale#lsp_linter#CheckWithLSP(bufnr(''), linter)
"       nnoremap <buffer> gk :ALEDocumentation<cr>
"       " nnoremap <buffer> gr :ALEFindReferences<cr>
"       nnoremap <buffer> gd :ALEGoToDefinition<cr>
"       nnoremap <buffer> gy :ALEGoToTypeDefinition<cr>
"       nnoremap <buffer> gh :ALEHover<cr>
"       setlocal omnifunc=ale#completion#OmniFunc
"     endif
"   endfor
" endfunction

" augroup ALEMappings
"   autocmd BufRead,FileType * call ALELSPMappings()
" augroup END
"}}}
Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
" tpope/vim-commentary {{{
vnoremap <silent> gc :Commentary<CR>
"}}}
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
" mhinz/vim-grepper {{{
nnoremap <silent>gr :Grepper<CR>
nnoremap gp :Grepper-
nnoremap gc :Grepper-cd<CR>
nnoremap gb :Grepper-buffer<CR>
"}}}
Plug 'liuchengxu/vista.vim', { 'on': 'Vista' }
" liuchengxu/vista.vim {{{
nnoremap <Leader>v :Vista!!<CR>
let g:vista_sidebar_width = 60
let g:vista_default_executive = 'coc'
"}}}
Plug 'stefandtw/quickfix-reflector.vim', { 'for': 'qf' }
" stefandtw/quickfix-reflector.vim {{{
let g:qf_modifiable = 1
let g:qf_write_changes = 1
"}}}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" liuchengxu/vim-which-key {{{
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> , :<c-u>WhichKey ','<CR>
nnoremap <silent> s :<c-u>WhichKey 's'<CR>
nnoremap <silent> c :<c-u>WhichKey 'c'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"}}}
Plug 't9md/vim-quickhl', { 'on': 'QuickhlCwordToggle' }
" t9md/vim-quickhl {{{
nnoremap <Leader>k :QuickhlCwordToggle<CR>
nmap <Leader>h <plug>(quickhl-manual-this)
xmap <Leader>h <plug>(quickhl-manual-this)
nmap <Leader>H <plug>(quickhl-manual-reset)
xmap <Leader>H <plug>(quickhl-manual-reset)
"}}}
Plug 'junegunn/limelight.vim', { 'on': [ 'Limelight', 'Limelight!', 'Limelight!!' ] }
" junegunn/limelight.vim {{{
nnoremap <silent> <Leader>m :Limelight!!<CR>
"}}}
Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }
" simeji/winresizer {{{
let g:winresizer_start_key = 'ge'
nnoremap <silent> ge :WinResizerStartResize<CR>
"}}}
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
" junegunn/vim-easy-align {{{
" =の代わりに使えるその他
" コマンド	説明
" =	一致した一つ目の=を基準に整列させる
" 2=	一致した二つ目の=を基準に整列させる
" *=	一致した全ての=を基準に整列させる
" **=	一致した全ての=を基準に左右交互に整列させる
" Enter	整列させる位置を（左/ 右/ 中央）で切り替える
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}
Plug 'kshenoy/vim-signature', { 'on': 'M' }
" kshenoy/vim-signature {{{
nnoremap <silent>gm :SignatureListGlobalMarks<CR>
"}}}
Plug 'Yggdroot/indentLine'
" Yggdroot/indentLine {{{
let g:indentLine_faster = 1
let g:indentLine_char_list = ['¦', '┆', '┊']
"}}}
Plug 'unblevable/quick-scope'
" unblevable/quick-scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"}}}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive', { 'on': 'G' }
Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
Plug 'cocopon/colorswatch.vim', { 'on': 'ColorSwatchGenerate' }
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
" fatih/vim-go {{{
let g:go_fmt_command = "gofmt"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"}}}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" iamcco/mathjax-support-for-mkdp {{{
let g:mkdp_echo_preview_url = 1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
"}}}
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
" not usually {{{
" Plug 'luochen1990/rainbow'
" Plug 'dstein64/nvim-scrollview'
" Plug 'towolf/vim-helm', { 'for': 'helm' }
" Plug 'aklt/plantuml-syntax', { 'for': 'uml' }
" Plug 'scrooloose/vim-slumlord', { 'for': 'uml' }
" Plug 'justmao945/vim-clang', { 'for': 'c' }
" Plug 'idanarye/vim-smile', { 'on': 'Smile' }
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" Plug 'ryanoasis/vim-devicons'
" Plug 'jreybert/vimagit', { 'on': 'Magit' }
  " nnoremap <silent>ga :Magit<CR>
" Plug 'kis9a/coc-hello', {'do': 'yarn install --frozen-lockfile && yarn build'}
" Plug 'lambdalisue/gina.vim'
 " nnoremap <Leader>gn :Gina 
" Plug 'vimwiki/vimwiki'
" Plug 'gruvbox/gruvbox.vim'
" Plug 'luochen1990/rainbowl'
" Plug 'terryma/vim-expand-region'
" Plug 'reedes/vim-wordy'
" Plug 'rhysd/vim-grammarous'
" Plug 'thinca/vim-quickrun'
" Plug 'tyru/open-browser.vim'
" Plug 'SirVer/ultisnips'
" Plug 'embear/vim-localvimrc'
" Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  " let g:undotree_WindowLayout = 2
  " let g:undotree_SplitWidth = 50
  " let g:undotree_DiffpanelHeight = 10
" Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
" Plug 'easymotion/vim-easymotion'
  " nmap , <Leader><Leader>
  " nmap ,, <ESC><Plug>(easymotion-overwin-f)
  " nmap ,/ <ESC><Plug>(easymotion-overwin-f2)
" Plug 'vim-scripts/dbext.vim'
" Plug 'tpope/vim-dadbod'
" Plug 'joshdick/onedark.vim'
" Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
" Plug 'voldikss/vim-translator'
"" voldikss/vim-translator {{{
"let g:translator_target_lang='ja'
"nmap <silent> <Leader>t <Plug>Translate
"vmap <silent> <Leader>t <Plug>TranslateV
"nmap <silent> <Leader>w <Plug>TranslateW
"vmap <silent> <Leader>w <Plug>TranslateWV
"nmap <silent> <Leader>l <Plug>TranslateR
"vmap <silent> <Leader>l <Plug>TranslateRV
""}}}
" Plug 'mattn/emmet-vim'
"" mattn/emmet-vim {{{
"let g:user_emmet_leader_key='<c-z>'
""}}}
" Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'tsx', 'vue'] }
" alvan/vim-closetag {{{
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.vue,*,tsx"
"}}}
" Plug 'dhruvasagar/vim-table-mode'
" dhruvasagar/vim-table-mode {{{
" let g:table_mode_corner = '|'
"}}}
"}}}
call plug#end()

" treesitter{{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {json},
    indent = {
      enable = true
    }
  },
  ensure_installed = 'all'
}
EOF
"}}}
