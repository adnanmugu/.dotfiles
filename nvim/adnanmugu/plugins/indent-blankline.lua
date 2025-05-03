return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local api = vim.api
    api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#1d2021" })
    api.nvim_set_hl(0, "IndentBlanklineScope", { fg = "#665c54", bold = true })

    require("ibl").setup {
      indent = {
        char = "┆",
        highlight = "IndentBlanklineChar",
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
        highlight = { "IndentBlanklineScope" },

      },
      exclude = {
        filetypes = {
          "help",
          "markdown",
          "gitcommit",
          "NvimTree",
          "help",
          "TelescopePrompt",
          "scss",
          "css",
        }
      },

    }
    -- keymap
    vim.keymap.set("n", "<leader>ibl", ":IBLToggle<CR>", { desc = "Toggle indent-blankline" })
  end
}
