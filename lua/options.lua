-- Make line numbers default
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- [[ Additional suggested options ]]
-- Enable persistent undo
vim.opt.undodir = vim.fn.expand '~/.vim/undodir'
vim.opt.undofile = true

-- Enable true color support
vim.opt.termguicolors = true

-- Set a larger history size
vim.opt.history = 1000

-- Disable swap files
vim.opt.swapfile = false

-- Enable line wrapping at word boundaries
vim.opt.linebreak = true
vim.opt.breakat = ' '

-- Always display the status line
vim.opt.laststatus = 2

-- Highlight the current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Highlight search matches
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable smart tab behavior
vim.opt.smarttab = true

-- Set tab and indentation size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enable hidden buffers
vim.opt.hidden = true

-- Enable auto-reading of files changed outside of Vim
vim.opt.autoread = true
vim.cmd [[autocmd FocusGained,BufEnter * checktime]]

-- Set default fold method
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 99

-- Faster completion
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Set default file encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim: ts=4 sts=4 sw=4 et
