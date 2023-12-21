local builtin = require("statuscol.builtin")
local cfg = {
  setopt = true,         -- Whether to set the 'statuscolumn' option, may be set to false for those who
                         -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
                         -- Although I recommend just using the segments field below to build your
                         -- statuscolumn to benefit from the performance optimizations in this plugin.
  -- builtin.lnumfunc number string options
  thousands = false,     -- or line number thousands separator string ("." / ",")
  relculright = false,   -- whether to right-align the cursor line number with 'relativenumber' set
  -- Builtin 'statuscolumn' options
  ft_ignore = nil,       -- lua table with 'filetype' values for which 'statuscolumn' will be unset
  bt_ignore = nil,       -- lua table with 'buftype' values for which 'statuscolumn' will be unset
  -- Default segments (fold -> sign -> line number + separator), explained below
  segments = {
    { text = { "%C" }, click = "v:lua.ScFa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
    {
      text = { builtin.lnumfunc, " " },
      condition = { true, builtin.not_empty },
      click = "v:lua.ScLa",
    },

    {
  text = { "%C" },       -- table of strings or functions returning a string
  click = "v:lua.ScFa",  -- %@ click function label, applies to each text element
  hl = "FoldColumn",     -- %# highlight group label, applies to each text element
  condition = { true },  -- table of booleans or functions returning a boolean
  sign = {               -- table of fields that configure a sign segment
    -- at least one of "name", "text", and "namespace" is required
    -- legacy signs are matched against the defined sign name e.g. "DiagnosticSignError"
    -- extmark signs can be matched against either the namespace or the sign text itself
    name = { ".*" },     -- table of lua patterns to match the sign name against
    text = { ".*" },     -- table of lua patterns to match the extmark sign text against
    namespace = { ".*" },-- table of lua patterns to match the extmark sign namespace against
    -- below values list the default when omitted:
    maxwidth = 1,        -- maximum number of signs that will be displayed in this segment
    colwidth = 2,        -- number of display cells per sign in this segment
    auto = false,        -- when true, the segment will not be drawn if no signs matching
                         -- the pattern are currently placed in the buffer.
    wrap = false,        -- when true, signs in this segment will also be drawn on the
                         -- virtual or wrapped part of a line (when v:virtnum != 0).
    fillchar = " ",      -- character used to fill a segment with less signs than maxwidth
    fillcharhl = nil,    -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
  }
},
{
  lnum = 43,     -- v:lnum
  relnum = 5,    -- v:relnum
  virtnum = 0,   -- v:virtnum
  buf = 1,       -- buffer handle
  win = 1000,    -- window handle
  nu = true,     -- 'number' option value
  rnu = true,    -- 'relativenumber' option value
  empty = true,  -- statuscolumn is currently empty
  fold = {
    width = 1,   -- current width of the fold column
    -- 'fillchars' option values:
    close = "", -- foldclose
    open = "",  -- foldopen
    sep = " "    -- foldsep
  },
  -- FFI data:
  tick = 251ULL, -- display_tick value
  wp = cdata<struct 112 *>: 0x560b56519a50 -- win_T pointer handle
},
  },
  clickmod = "c",         -- modifier used for certain actions in the builtin clickhandlers:
                          -- "a" for Alt, "c" for Ctrl and "m" for Meta.
  clickhandlers = {       -- builtin click handlers
    Lnum                    = builtin.lnum_click,
    FoldClose               = builtin.foldclose_click,
    FoldOpen                = builtin.foldopen_click,
    FoldOther               = builtin.foldother_click,
    DapBreakpointRejected   = builtin.toggle_breakpoint,
    DapBreakpoint           = builtin.toggle_breakpoint,
    DapBreakpointCondition  = builtin.toggle_breakpoint,
    DiagnosticSignError     = builtin.diagnostic_click,
    DiagnosticSignHint      = builtin.diagnostic_click,
    DiagnosticSignInfo      = builtin.diagnostic_click,
    DiagnosticSignWarn      = builtin.diagnostic_click,
    GitSignsTopdelete       = builtin.gitsigns_click,
    GitSignsUntracked       = builtin.gitsigns_click,
    GitSignsAdd             = builtin.gitsigns_click,
    GitSignsChange          = builtin.gitsigns_click,
    GitSignsChangedelete    = builtin.gitsigns_click,
    GitSignsDelete          = builtin.gitsigns_click,
    gitsigns_extmark_signs_ = builtin.gitsigns_click,
  },
  
}


local builtin = require("statuscol.builtin")
require("statuscol").setup({
  segments = {
    {
      text = {
        " ",               -- whitespace padding
        function(args)     -- custom line number highlight function
          return ((args.lnum % 2 > 0) and "%#DiffDelete#%=" or "%#DiffAdd#%=").."%l"
        end,
        " ",               -- whitespace padding
      },
      condition = {
        true,              -- always shown
        function(args)     -- shown only for the current window
          return vim.api.nvim_get_current_win() == args.win
        end,
        builtin.notempty,  -- only shown when the rest of the statuscolumn is not empty
      },
    }
  }
})

local cfg = {
  --- The click actions have the following signature:
  ---@param args (table): {
  ---   minwid = minwid,            -- 1st argument to 'statuscolumn' %@ callback
  ---   clicks = clicks,            -- 2nd argument to 'statuscolumn' %@ callback
  ---   button = button,            -- 3rd argument to 'statuscolumn' %@ callback
  ---   mods = mods,                -- 4th argument to 'statuscolumn' %@ callback
  ---   mousepos = f.getmousepos()  -- getmousepos() table, containing clicked line number/window id etc.
  --- }
  clickhandlers = {
    FoldOther = false,  -- Disable builtin clickhandler
    Lnum = function(args)
      if args.button == "l" and args.mods:find("c") then
        print("I Ctrl-left clicked on line "..args.mousepos.line)
      end
    end,
  }
}

require("statuscol").setup(cfg)