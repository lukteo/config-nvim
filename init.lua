--[[
  minimal config
  ======================

  design goals:
    - single file
    - use native nvim features (>= v0.12)
    - use default keybindings unless painful otherwise
    - use built-ins unless painful otherwise
    - use vim colorschemes
    - plugins must be integral to workflow
]]

local vim = vim -- suppress lsp warnings
vim.cmd("colorscheme vim")

-- OPT CONFIG
local o = vim.opt
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.wrap = false
o.autoread = true
o.list = true
o.signcolumn = "yes"
o.backspace = "indent,eol,start"
o.shell = "/bin/zsh"
o.colorcolumn = "100"
o.completeopt = { "menu", "menuone", "fuzzy", "noinsert", "noselect", "popup" }
o.wildmode = { "lastused", "full" }
o.pumheight = 15
o.laststatus = 0
o.winborder = "rounded"
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.swapfile = false
o.foldmethod = "indent"
o.foldlevelstart = 99
o.number = true
o.relativenumber = true
o.scrolloff = 10
o.termguicolors = false
o.cursorline = false

-- GLOBAL CONFIG
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

-- KEYMAPS
local opts = { silent = true }
local map = vim.keymap.set
map("t", "<Esc>", [[<C-\><C-n>]], opts)      -- exit terminal mode
map("n", "Q", "<nop>", opts)                 -- disable "Q"
map("n", "<C-k>", "<cmd>wincmd k<cr>", opts) -- navigate splits
map("n", "<C-j>", "<cmd>wincmd j<cr>", opts)
map("n", "<C-h>", "<cmd>wincmd h<cr>", opts)
map("n", "<C-l>", "<cmd>wincmd l<cr>", opts)
map('n', '<leader>qq', '<cmd>qa<cr>') -- quit all
map("n", "<leader>q", "<cmd>bd!<cr>", opts)
map("n", "<leader>t", "<cmd>term zsh<cr>", opts)
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "<leader>y", function() -- copy relative filepath to clipboard
  vim.fn.setreg("+", vim.fn.expand("%"))
end)
map("n", "<leader>r", function() -- toggle lsp loclist
  local loclist_win = vim.fn.getloclist(0, { winid = 0 }).winid
  if loclist_win > 0 then
    vim.cmd("lclose")
  else
    vim.diagnostic.setloclist({ open = true })
  end
end, opts)
map("n", "<leader>s", function() -- toggle quickfix
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end)
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>')         -- escape and clear hlsearch
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>') -- save file
map('i', 'jj', '<esc>')                                 -- exit insert mode
map('n', ';e', '<cmd>Oil<cr>')                          -- Open Oil explorer
map('n', '<leader>ww', '<C-W>p')
map('n', '<leader>wd', '<C-W>c')
map('n', '<leader>w-', '<C-W>s')
map('n', '<leader>w|', '<C-W>v')
map('n', '<leader>-', '<C-W>s')
map('n', '<leader>|', '<C-W>v')
map('n', '<leader>cd', vim.diagnostic.open_float)
map('n', '<leader>fB', '<cmd>FzfLua buffers<cr>')
map('n', '<leader>fc', '<cmd>FzfLua highlights<cr>')
map('n', '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>')
map('n', '<leader>ff', '<cmd>FzfLua files<cr>')
map('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>')
map('x', '<leader>fg', '<cmd>FzfLua grep_visual<cr>')
map('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>')
map('n', '<leader>fr', '<cmd>FzfLua oldfiles<cr>')
map('n', '<leader>f<', '<cmd>FzfLua resume<cr>')
map('n', '<leader>gg', '<cmd>LazyGit<cr>')

-- AUTOCMD
local augroup = vim.api.nvim_create_augroup("min.cfg", { clear = true })
local autocmd = vim.api.nvim_create_autocmd
autocmd("Filetype", { group = augroup, pattern = "make", command = "setlocal noexpandtab tabstop=4 shiftwidth=4" })
autocmd("BufEnter", { -- disable automatic newline comment continuation
  callback = function()
    o.formatoptions = vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- LSP
local function setup_lsp()
  vim.lsp.enable({
    "gopls", -- os package mgr: gopls
    "zls",   -- os package mgr: zls
    "lua_ls",
    "vtsls",
  })

  autocmd("LspAttach", {
    group = augroup,
    callback = function(ev)
      local bufopts = { noremap = true, silent = true, buffer = ev.buf }
      map("n", "grd", vim.lsp.buf.definition, bufopts)
      map("i", "<C-k>", vim.lsp.completion.get, bufopts) -- open completion menu manually
      local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
      local methods = vim.lsp.protocol.Methods
      if client:supports_method(methods.textDocument_completion) then
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      end
    end,
  })
end

-- PLUGINS
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  'https://github.com/kdheepak/lazygit.nvim',
  "https://github.com/stevearc/conform.nvim",
})

-- RUNNER/SETUP
setup_lsp()
require('oil').setup {
  keymaps = { ['<C-h>'] = false },
  columns = { 'size', 'mtime' },
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
}
require('fzf-lua').setup {}
require("conform").setup({
  formatters_by_ft = {
    c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
    go = { 'gofumpt', 'goimports-reviser', 'golines' },
    javascript = { 'biome-check', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
    javascriptreact = { 'biome-check', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
    json = { 'biome-check', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
    lua = { 'stylua' },
    markdown = { 'biome-check' },
    sh = { 'shfmt' },
    typescript = { 'biome-check', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
    typescriptreact = { 'biome-check', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
    yaml = { 'yamlfmt', 'yamlfix' },
    -- For filetypes without a formatter:
    ['_'] = { 'trim_whitespace', 'trim_newlines' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
