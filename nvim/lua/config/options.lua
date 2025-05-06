local opt = vim.opt

opt.guicursor = { "a:blinkwait700-blinkoff400-blinkon250" }
-- opt.cursorline = true  -- highlight the current line
opt.compatible = false -- cisable compatibility with old vi

opt.number = true -- enable linenum
opt.relativenumber = true -- enable relativenum
opt.linebreak = true -- enable line wrapper
opt.termguicolors = true -- use full 24-bit color

opt.tabstop = 2 -- tab character looks like 2 spaces
opt.shiftwidth = 2 -- indent size (used for >> << autoindent)
opt.softtabstop = 2 -- makes tab like insert 2 spaces
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- auto indent new lines
opt.smartindent = true -- more advance auto indent
opt.mouse = "a" -- enable mouse support

opt.wrap = true -- wrap text when reach limit

opt.swapfile = false -- disable swapfile
opt.backup = false -- disable backup file

opt.hlsearch = true -- highlight search results
opt.incsearch = true -- incremental search

opt.scrolloff = 8 -- vertical scrolling
opt.signcolumn = "yes" --
opt.isfname:append("@-@") --
opt.updatetime = 50 --

opt.colorcolumn = "80" -- set an 80-character border
opt.ttyfast = true -- speed up scrolling

opt.showmatch = true -- show matching brackets
opt.ignorecase = true -- case insensitive search
-- opt.clipboard = "unnamedplus" -- use system clipboard

opt.wildmode = { "longest", "list" } -- cmdline bash-like completion

local termfeatures = vim.g.termfeatures or {}
termfeatures.osc52 = true
vim.g.termfeatures = termfeatures
