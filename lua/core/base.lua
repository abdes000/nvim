-- VIM OPTIONS
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.wrap = false       -- Long lines are not wrapper
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitbelow = true  -- Cursor go on the left window when split
vim.opt.splitright = true  -- Cursor go on the right windows when split
vim.opt.confirm = true     -- Confirm before closing an unsaved buffer
vim.opt.cursorline = true  -- Highlight current line
vim.opt.autowrite = true
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Insert indents automatically

