require("focus").setup({
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = true, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    }
})

-- Force width for the focused window
-- Default: Calculated based on golden ratio
require("focus").setup({ autoresize = { width = 120 } })

-- Force minimum width for the unfocused window
-- Default: Calculated based on golden ratio
require("focus").setup({ autoresize = { minwidth = 80} })

-- Force height for the focused window
-- Default: Calculated based on golden ratio
require("focus").setup({ autoresize = { height = 40 } })

-- Force minimum height for the unfocused window
-- Default: 0
require("focus").setup({ autoresize = { minheight = 10} })

-- Sets the height of quickfix panel, in case you pass the height to
-- `:copen <height>`
-- Default: 10
require("focus").setup({ autoresize = { height_quickfix = 10 })

-- True: When a :Focus.. command creates a new split window, initialise it as a new blank buffer
-- False: When a :Focus.. command creates a new split, retain a copy of the current window in the new window
-- Default: false
require("focus").setup({ split = { bufnew = true } })


-- Displays line numbers in the focussed window only
-- Not displayed in unfocussed windows
-- Default: true
require("focus").setup({ui = { number = false } })

-- Displays relative line numbers in the focussed window only
-- Not displayed in unfocussed windows
-- See :help relativenumber
-- Default: false
require("focus").setup({ ui = { relativenumber = true } })

-- Displays hybrid line numbers in the focussed window only
-- Not displayed in unfocussed windows
-- Combination of :help relativenumber, but also displays the line number of the
-- current line only
-- Default: false
require("focus").setup({ ui = { hybridnumber = true} })


-- Preserve absolute numbers in the unfocussed windows
-- Works in combination with relativenumber or hybridnumber
-- Default: false
require("focus").setup({ ui = { absolutenumber_unfocussed = true } })


-- Displays a cursorline in the focussed window only
-- Not displayed in unfocussed windows
-- Default: true
require("focus").setup({ ui = { cursorline = false } })


-- Displays a cursor column in the focussed window only
-- See :help cursorcolumn for more options
-- Default: false
require("focus").setup({ ui = { cursorcolumn = true } })

-- Displays a color column in the focussed window only
-- See :help colorcolumn for more options
-- Default: enable = false, list = '+1'
require("focus").setup({
    ui = {
        colorcolumn = {
            enable = true,
            list = '+1,+2'
        }
    }
})

-- Displays a sign column in the focussed window only
-- Gets the vim variable setcolumn when focus.setup() is run
-- See :help signcolumn for more options e.g :set signcolum=yes
-- Default: true, signcolumn=auto
require("focus").setup({ ui = { signcolumn = false } })

-- Enable auto highlighting for focussed/unfocussed windows
-- Default: false
require("focus").setup({ ui = { winhighlight = true } })

-- By default, the highlight groups are setup as such:
--   hi default link FocusedWindow VertSplit
--   hi default link UnfocusedWindow Normal
-- To change them, you can link them to a different highlight group, see
-- `:help hi-default` for more info.
vim.highlight.link('FocusedWindow', 'CursorLine', true)
vim.highlight.link('UnfocusedWindow', 'VisualNOS', true)

