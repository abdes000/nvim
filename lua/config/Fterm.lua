require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


require("Fterm"),setup(
    {
    ---Filetype of the terminal buffer
    ---@type string
    ft = 'FTerm',

    ---Command to run inside the terminal
    ---NOTE: if given string[], it will skip the shell and directly executes the command
    ---@type fun():(string|string[])|string|string[]
    cmd = os.getenv('SHELL'),

    ---Neovim's native window border. See `:h nvim_open_win` for more configuration options.
    border = 'single',

    ---Close the terminal as soon as shell/command exits.
    ---Disabling this will mimic the native terminal behaviour.
    ---@type boolean
    auto_close = true,

    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = 'Normal',

    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,

    ---Object containing the terminal window dimensions.
    ---The value for each field should be between `0` and `1`
    ---@type table<string,number>
    dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.8, -- Width of the terminal window
        x = 0.5, -- X axis of the terminal window
        y = 0.5, -- Y axis of the terminal window
    },

    ---Replace instead of extend the current environment with `env`.
    ---See `:h jobstart-options`
    ---@type boolean
    clear_env = false,

    ---Map of environment variables extending the current environment.
    ---See `:h jobstart-options`
    ---@type table<string,string>|nil
    env = nil,

    ---Callback invoked when the terminal exits.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_exit = nil,

    ---Callback invoked when the terminal emits stdout data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stdout = nil,

    ---Callback invoked when the terminal emits stderr data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stderr = nil,
}
)

require('FTerm').open()

-- -- or create a vim command
-- vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })

-- vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
-- vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })

-- vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })



-- run() can take `string` or `table` just like `cmd` config
require('FTerm').run('man ls') -- with string
require('FTerm').run({'yarn', 'build'})
require('FTerm').run({'node', vim.api.nvim_get_current_buf()})

-- Or you can do this
vim.api.nvim_create_user_command('ManLs', function()
    require('FTerm').run('man ls')
end, { bang = true })

vim.api.nvim_create_user_command('YarnBuild', function()
    require('FTerm').run({'yarn', 'build'})
end, { bang = true })

require('FTerm').scratch({ cmd = 'yarn build' })
require('FTerm').scratch({ cmd = {'cargo', 'build', '--target', os.getenv('RUST_TARGET')} })

-- Scratch terminals are awesome because you can do this
vim.api.nvim_create_user_command('YarnBuild', function()
    require('FTerm').scratch({ cmd = {'yarn', 'build'} })
end, { bang = true })

vim.api.nvim_create_user_command('CargoBuild', function()
    require('FTerm').scratch({ cmd = {'cargo', 'build', '--target', os.getenv("RUST_TARGET")} })
end, { bang = true })

-- Code Runner - execute commands in a floating terminal
local runners = { lua = 'lua', javascript = 'node' }

vim.keymap.set('n', '<leader><Enter>', function()
    local buf = vim.api.nvim_buf_get_name(0)
    local ftype = vim.filetype.match({ filename = buf })
    local exec = runners[ftype]
    if exec ~= nil then
        require('FTerm').scratch({ cmd = { exec, buf } })
    end
end)

local fterm = require("FTerm")

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set('n', '<A-g>', function()
    gitui:toggle()
end)

local fterm = require("FTerm")

local btop = fterm:new({
    ft = 'fterm_btop',
    cmd = "btop"
})

 -- Use this to toggle btop in a floating terminal
vim.keymap.set('n', '<A-b>', function()
    btop:toggle()
end)

