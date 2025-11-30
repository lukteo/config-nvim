-- Adds git related signs to the gutter
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = 'A' },
        change = { text = 'M' },
        delete = { text = 'D' },
        topdelete = { text = 'T' },
        changedelete = { text = 'C' },
      },
      signs_staged = {
        add = { text = 'SA' },
        untracked = { text = 'SU' },
        change = { text = 'SM' },
        delete = { text = 'SD' },
        topdelete = { text = 'ST' },
        changedelete = { text = 'SC' },
      },
      preview_config = { border = 'rounded' },
      current_line_blame = true,
      gh = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Register the leader group with miniclue.
        vim.b[bufnr].miniclue_config = {
          clues = {
            { mode = 'n', keys = '<leader>g', desc = '+git' },
            { mode = 'x', keys = '<leader>g', desc = '+git' },
          },
        }

        -- Mappings.
        ---@param lhs string
        ---@param rhs function
        ---@param desc string
        local function nmap(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { desc = desc, buffer = bufnr })
        end
        nmap('[g', gs.prev_hunk, 'Previous hunk')
        nmap(']g', gs.next_hunk, 'Next hunk')
        nmap('<leader>gR', gs.reset_buffer, 'Reset buffer')
        nmap('<leader>gb', gs.blame_line, 'Blame line')
        nmap('<leader>gp', gs.preview_hunk, 'Preview hunk')
        nmap('<leader>gr', gs.reset_hunk, 'Reset hunk')
        nmap('<leader>gs', gs.stage_hunk, 'Stage hunk')
        nmap('<leader>gl', function()
          require('float_term').float_term('lazygit', {
            size = { width = 0.85, height = 0.8 },
            cwd = vim.b.gitsigns_status_dict.root,
          })
        end, 'Lazygit')
      end,
    },
  },
}
