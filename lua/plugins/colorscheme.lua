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
  {
    'protesilaos/tempus-themes-vim',
    name = 'tempus_classic', -- You can name it anything, but this is descriptive
    priority = 1000, -- ensures the colorscheme loads early
    config = function()
      -- Set the colorscheme after the plugin is loaded
      vim.cmd.colorscheme 'tempus_classic'
    end,
  },
}
