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
  Plug 'easymotion/vim-easymotion'

  " color
  Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
  Plug 'cocopon/colorswatch.vim', { 'on': 'ColorSwatchGenerate' }

  " markdown/documentation
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  " Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
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
