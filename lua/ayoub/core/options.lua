local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- set completeopt to have a better copletion experience
opt.completeopt = "menuone,noselect"
-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- apearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- adds dash (-) to the world, so when deleting a word containing a dash it deletes the whole word

-- Set scrolloff to 8
opt.scrolloff = 3

-- Set an undo file to keep history of changes
-- set undodir=~/.vim/undodir
opt.undodir = vim.fn.stdpath("config") .. "/undodir"
-- opt.undodir = "~/.config/nvim/undodir"
opt.undofile = true
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Spell checking configuration
opt.spelllang = "en_us"
opt.spell = true
