require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = '|',
  },
  sections = {
    lualine_b = {
      {
        "filename",
      },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = "✘ ", warn = "▲ ", info = "I ", hint = "⚑ " },
      },
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
  },
})
