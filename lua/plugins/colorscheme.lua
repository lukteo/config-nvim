-- Colorscheme used
return {
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {
  --       transparent = true,
  --       -- optional configuration here
  --     }
  --     require('bamboo').load()
  --   end,
  -- },
  -- {
  --   'protesilaos/tempus-themes-vim',
  --   name = 'tempus_classic', -- You can name it anything, but this is descriptive
  --   priority = 1000, -- ensures the colorscheme loads early
  --   config = function()
  --     -- Set the colorscheme after the plugin is loaded
  --     vim.cmd.colorscheme 'tempus_classic'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavour = 'mocha', -- latte, frappe, macchiato, mocha
  --       term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  --       dim_inactive = {
  --         enabled = true, -- dims the background color of inactive window
  --       },
  --     }
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },
  -- {
  --   'funnyVariable/blank.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = 'light'
  --     vim.cmd 'colorscheme blank'
  --   end,
  -- },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        -- Here you can set various options
        theme = 'wave', -- available themes: wave, dragon, lotus
        -- other options, for example:
        compile = true,
        dimInactive = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none', -- disable background on the gutter
              },
            },
          },
        },
        -- ... more options can be found on the plugin's [GitHub page](https://github.com/rebelot/kanagawa.nvim)
      }

      -- Load the colorscheme
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
