--[[
 ________  _______   ________         ___  ________      ________   ___      ___ ___  _____ ______      
|\   __  \|\  ___ \ |\   ___  \      |\  \|\   __  \    |\   ___  \|\  \    /  /|\  \|\   _ \  _   \    
\ \  \|\ /\ \   __/|\ \  \\ \  \     \ \  \ \  \|\  \   \ \  \\ \  \ \  \  /  / | \  \ \  \\\__\ \  \   
 \ \   __  \ \  \_|/_\ \  \\ \  \  __ \ \  \ \  \\\  \   \ \  \\ \  \ \  \/  / / \ \  \ \  \\|__| \  \  
  \ \  \|\  \ \  \_|\ \ \  \\ \  \|\  \\_\  \ \  \\\  \ __\ \  \\ \  \ \    / /   \ \  \ \  \    \ \  \ 
   \ \_______\ \_______\ \__\\ \__\ \________\ \_______\\__\ \__\\ \__\ \__/ /     \ \__\ \__\    \ \__\
    \|_______|\|_______|\|__| \|__|\|________|\|_______\|__|\|__| \|__|\|__|/       \|__|\|__|     \|__|
                                                                                                        

]]
--

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- enable relative line numbers with absolute number on the current line
vim.opt.number = true -- show absolute number on current line
vim.opt.relativenumber = true

-- enable mouse mode
vim.o.mouse = 'a'
-- scroll 1 line at a time
vim.opt.mousescroll = 'ver:1,hor:1'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- set tab behavior
vim.opt.tabstop = 2 -- number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2 -- number of spaces to use for autoindent
vim.opt.softtabstop = 2 -- number of spaces a <Tab> counts for in insert mode
vim.opt.expandtab = true -- convert tabs to spaces

require 'keymaps'

require 'plugins'

-- adds luasnip html snippets to .tsx files
require('luasnip').filetype_extend('typescriptreact', { 'html' })
