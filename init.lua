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

-- vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', ';', ':')

-- Neovide <<<

if vim.g.neovide then
  vim.o.guifont = "marco Nerd Font Mono:#e-subpixelantialias:h12"

  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_remember_window_size = true

  local opts = { noremap = true, silent = true }
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set('n', '<D-s>', ':w<CR>', opts) -- Save
  vim.keymap.set('v', '<D-c>', '"+y', opts) -- Copy
  vim.keymap.set('n', '<D-v>', '"+P', opts) -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P', opts) -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+', opts) -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-o>"+p', opts) -- Paste insert mode
end
-- >>>

-- OS Specific <<<

-- >>>

-- vim: set foldmarker=<<<,>>> foldmethod=marker ts=2 sts=2 sw=2 et:
