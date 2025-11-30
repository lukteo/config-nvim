-- Colorscheme used
return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        transparent = true,
        -- optional configuration here
      }
      require('bamboo').load()
    end,
  },
}
