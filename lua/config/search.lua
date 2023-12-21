require('search').open({ tab_id = 2 })
require("search").setup({
  append_tabs = { -- append_tabs will add the provided tabs to the default ones
    {
      name = "Commits",
      tele_func = require('telescope.builtin').git_commits,
      available = function()
        return vim.fn.isdirectory(".git") == 1
      end
    }
  }
})