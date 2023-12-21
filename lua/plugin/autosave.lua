return {
  "Pocco81/auto-save.nvim",
  enabled = true,
  config = function()
    local autosave = require("auto-save")
    autosave.setup({
      execution_message = {
        message = function()
        end,
      },
      trigger_events = { "TextChangedI" },
    })
  end,
}