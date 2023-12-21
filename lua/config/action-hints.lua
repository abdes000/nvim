require("lualine").setup({
  sections = {
    lualine_x = { require("action-hints").statusline },
  },
})