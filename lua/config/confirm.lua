require "confirm-quit".confirm_quit()     -- :ConfirmQuit
require "confirm-quit".confirm_quit_all() -- :ConfirmQuitAll

require "confirm-quit".confirm_quit { bang = true }     -- ConfirmQuit!
require "confirm-quit".confirm_quit_all { bang = true } -- ConfirmQuitAll!


vim.keymap.set("n", "<leader>q", require "confirm-quit".confirm_quit)
vim.keymap.set("n", "<leader>Q", require "confirm-quit".confirm_quit_all)
