return {
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'kanagawa'
  --   end,
  -- },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme 'gruvbox-material'
  --   end,
  -- },
  {
    'zenbones-theme/zenbones.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      'rktjmp/lush.nvim',
    },
    config = function()
      vim.opt.background = 'light'
      vim.g.neobones = {
        lightness = 'dim',
        darkness = 'stark',
      }
      vim.cmd.colorscheme 'neobones'
    end,
  },
}
