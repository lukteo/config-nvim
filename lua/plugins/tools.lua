return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      local wk = require 'which-key'
      wk.add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>h_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>t_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
        { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
      }
    end,
  },
  { -- Search all functionality
    'nvim-pack/nvim-spectre',
    build = false,
    cmd = 'Spectre',
    opts = { open_cmd = 'noswapfile vnew' },
    keys = {
      {
        '<leader>sr',
        function()
          require('spectre').open()
        end,
        desc = 'Replace in Files (Spectre)',
      },
    },
  },
  -- { -- Auto indent detection is not needed ?
  --   'tpope/vim-sleuth',
  --   opts = {},
  -- },
  { -- Automatically removes buffers after staying idle for a period of time
    'chrisgrieser/nvim-early-retirement',
    config = true,
    event = 'VeryLazy',
    opts = {
      retirementAgeMins = 5,
    },
  },
}
