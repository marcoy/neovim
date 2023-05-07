-- https://github.com/nvim-lua/kickstart.nvim
-- https://github.com/LazyVim/starter
-- https://github.com/LazyVim/LazyVim/
-- https://github.com/nicknisi/dotfiles/tree/main/config/nvim
-- https://github.com/joshmedeski/dotfiles

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Lazy <<<
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- >>>

-- General Settings <<<
vim.cmd([[
set visualbell
set noerrorbells
set ruler
set showcmd
set number
set laststatus=2
set cmdheight=2

set nobackup
set nowritebackup
set noswapfile

set hlsearch
set incsearch
set ignorecase
set smartcase

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smarttab

set laststatus=2
set showtabline=2

set backspace=indent,eol,start
set list
set list lcs=trail:·,tab:»·

set autoread
set splitright
set splitbelow
set history=10000
set background=dark
set hidden
set magic
set showmatch
set mat=2

set copyindent
set smartindent
set autoindent
set linebreak
set nowrap
set formatoptions+=t
]])
-- >>>

-- Colour Scheme
if vim.fn.has("gui_running") == 1 then
  vim.cmd("colorscheme bluloco")
else
  vim.cmd("colorscheme onedark")
end

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', ';', ':')

-- OS Specific <<<

-- >>>

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
