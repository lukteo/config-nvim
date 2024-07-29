return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = '󰱼 Search',
            group = 'Label',
            action = 'Telescope find_files',
            key = 's',
          },
          {
            desc = '  Explorer',
            group = 'Label',
            action = 'Oil',
            key = 'e',
          },
          {
            desc = '󰩈 Quit',
            group = 'Label',
            action = 'qa',
            key = 'q',
          },
        },
        mru = { limit = 10, cwd_only = true },
        footer = {},
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
