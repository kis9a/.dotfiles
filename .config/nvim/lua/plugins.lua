vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use


return require('packer').startup(function()
  use { 'wbthomason/packer.nvim', opt = true }
  use { 'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'} }
  use { 'tpope/vim-commentary', cmd = 'Commentary' }
  use { 'andymass/vim-matchup', event = 'VimEnter *' }
  use { 'w0rp/ale', opt = true, ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'}, cmd = 'ALEEnable', config = 'vim.cmd[[ALEEnable]]' }
  use { 'lambdalisue/gina.vim', opt = true, cmd = { 'Gina' } }
  use { 'tpope/vim-fugitive', opt = true, cmd = { 'Commits', 'BCommits', 'G', 'Git', 'Gblame', 'GBrowse', 'Gstatus' } }
  use { 'jreybert/vimagit', opt = true, cmd = { 'Magit' } }
  use { 'kdheepak/lazygit.nvim', cmd = 'LazyGit' }
  use { 'simeji/winresizer', opt = true, cmd = { 'WinResizerStartFocus', 'WinResizerStartResize' } }
  use { 'p00f/nvim-ts-rainbow', opt = true }
  use { 'unblevable/quick-scope' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'alvan/vim-closetag', opt = true, ft = { 'html', 'vue', 'jsx', 'tsx' } }
  use { 'voldikss/vim-translator', opt = true, cmd  = { 'Translate', 'TranslateV', 'TranslateW', 'TranslateWV' } }
  use { 'mhinz/vim-grepper', opt = true, cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } }
  use { 'kshenoy/vim-signature', opt = true, keys = {'m'} }
  use { 'stefandtw/quickfix-reflector.vim' }
  use { 'airblade/vim-rooter' }
  use { 'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime' }
  use { 't9md/vim-quickhl' }
  use { 'mbbill/undotree', opt = true, cmd = 'UndotreeToggle' }
  use { 'easymotion/vim-easymotion', opt = true, keys = {'<Leader><Leader>', ','} }
  use { 'guns/xterm-color-table.vim', opt = true, cmd = 'XTermColorTable' }
  use { 'cocopon/colorswatch.vim', opt = true, cmd = 'ColorSwatchGenerator' }
  use { 'tpope/vim-markdown', opt = true, ft = { 'markdown'} }
  use { 'iamcco/markdown-preview.nvim', opt = true, run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = { 'markdown' } }
  use { 'iamcco/mathjax-support-for-mkdp', opt = true, ft = { 'markdown' } }
  use { 'aklt/plantuml-syntax', opt = true, ft = { 'uml' } }
  use { 'scrooloose/vim-slumlord', opt = true, ft = { 'uml' } }
  use { 'fatih/vim-go', opt = true, ft = { 'go' } }
  use { 'rust-lang/rust.vim', opt = true, ft = { 'rust' } }
  use { 'cespare/vim-toml', opt = true, ft = { 'toml' } }
  use { 'jparise/vim-graphql', opt = true, ft = { 'graphql' } }
  use { 'towolf/vim-helm', opt = true, ft = { 'helm' } }
  use { 'tbastos/vim-lua', opt = true, ft = { 'lua' } }
  use { 'posva/vim-vue', opt = true, ft = { 'vue' } }
  use { 'leafgarland/typescript-vim', opt = true, ft = { 'js', 'ts', 'jsx', 'tsx' }}
  use { 'othree/yajs.vim', opt = true, ft = { 'js', 'ts', 'jsx', 'tsx' }}
  use { 'HerringtonDarkholme/yats.vim', opt = true, ft = { 'js', 'ts', 'jsx', 'tsx' } }
  use { 'justmao945/vim-clang', opt = true, ft = { 'c' } }
end)
