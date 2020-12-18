require('plugins')

vim.cmd('syntax on')

-- options
vim.o.encoding = 'UTF-8'
vim.o.hidden = true
vim.o.background = 'dark'
vim.o.autochdir = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.splitright = true
vim.o.clipboard='unnamed'
vim.o.laststatus = 2
vim.o.backup = false
vim.o.regexpengine = 1
vim.o.lazyredraw = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = false
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.switchbuf = 'newtab'
vim.o.modifiable = true

vim.wo.wrap = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.netrw_browsex_viewer = 'open'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers  = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
