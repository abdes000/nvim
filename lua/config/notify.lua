vim.notify = require("notify")
local plugin = "Notify"

vim.notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.log.levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(2000, 0, function()
      vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 3000,
        on_close = function()
          vim.notify("Problem solved", nil, { title = plugin })
          vim.notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
})


local async = require("plenary.async")
local notify = require("notify").async

async.run(function()
  notify("Let's wait for this to close").events.close()
  notify("It closed!")
end)

vim.notify(text, "info", {
  title = "My Awesome Plugin",
  on_open = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  end,
})
require("notify").history()