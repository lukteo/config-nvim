return {
  -- {
  --   'Mofiqul/vscode.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = 'light'
  --     require('vscode').setup {
  --       transparent = false,
  --       italic_comments = false,
  --       underline_links = true,
  --       terminal_colors = true,
  --     }
  --     vim.cmd.colorscheme 'vscode'
  --   end,
  -- },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_foreground = 'mix'
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.g.gruvbox_material_enable_bold = true
  --     vim.g.gruvbox_material_cursor = 'green'
  --     vim.g.gruvbox_material_dim_inactive_windows = true
  --     vim.g.gruvbox_material_ui_contrast = 'high'
  --     vim.cmd.colorscheme 'gruvbox-material'
  --   end,
  -- },
  {
    'echasnovski/mini.base16',
    version = '*',
    config = function()
      require('mini.base16').setup {
        palette = {
          -- base00 = '#000000', -- Background
          -- base01 = '#1E1E1E', -- Lighter background
          -- base02 = '#2A2A2A', -- Selection background
          -- base03 = '#555555', -- Comments, invisibles
          -- base04 = '#AAAAAA', -- Line numbers, UI hints
          -- base05 = '#E0E0E0', -- Default text
          -- base06 = '#FFB300', -- Functions (OZ yellow-orange)
          -- base07 = '#FF3B30', -- Constants / UI Red
          -- base08 = '#FF5252', -- Errors / alerts
          -- base09 = '#FF9100', -- Warnings
          -- base0A = '#FFC107', -- Yellow accents
          -- base0B = '#81C784', -- Success / green
          -- base0C = '#00ACC1', -- Cyan (notifications)
          -- base0D = '#64B5F6', -- Keywords / links (soft OZ blue)
          -- base0E = '#BA68C8', -- Purple / special tags
          -- base0F = '#FF4081', -- Deprecated / pink-red
          base00 = '#ffffff', -- white background
          base01 = '#f0f0f0',
          base02 = '#cccccc',
          base03 = '#555555',
          base04 = '#777777',
          base05 = '#000000', -- black main text
          base06 = '#222222',
          base07 = '#000000',
          base08 = '#cc0000', -- black accents instead of colorful accents
          base09 = '#aa5500',
          base0A = '#ff9900',
          base0B = '#008800',
          base0C = '#008888',
          base0D = '#0000cc',
          base0E = '#990099',
          base0F = '#cc00cc',
        },
      }
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'go', 'python' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' }, -- for outlier cases that requires regex help
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  { -- Tree view file structure
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },
  { -- NVIM like directory navigator
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons', enabled = true },
    config = function()
      require('oil').setup {
        columns = {
          {
            'icon',
            -- "permissions",
            -- "size",
            -- "mtime",
          },
        },
        cleanup_delay_ms = 2000,
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ['<C-c>'] = false,
          ['q'] = 'actions.close',
        },
      }
    end,
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },
  { -- Filename display
    'b0o/incline.nvim',
    event = 'BufReadPre',
    priority = 1200,
    config = function()
      require('incline').setup {
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if vim.bo[props.buf].modified then
            filename = '[+] ' .. filename
          end

          local icon, color = require('nvim-web-devicons').get_icon_color(filename)
          return { { icon, guifg = color }, { ' ' }, { filename } }
        end,
      }
    end,
  },
}
