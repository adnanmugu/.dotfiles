return {
  'ojroques/nvim-osc52',
  config = function()
    local osc = require('osc52')


    require('osc52').setup({
      max_length = 0,
      silent = false,
      trim = false,
      tmux_passthrough = false
    })

    vim.keymap.set("n", "<leader>c", osc.copy_operator, { expr = true })
    vim.keymap.set("v", "<leader>cc", osc.copy_visual)
    vim.keymap.set("n", "<leader>cc", '<leader>c_', { remap = true })
  end,
}
