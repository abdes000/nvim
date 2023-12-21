vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gvisual")
end)


local augend = require("dial.augend")
require("dial.config").augends:register_group{
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
  },

  -- augends used when group with name `mygroup` is specified
  mygroup = {
    augend.integer.alias.decimal,
    augend.constant.alias.bool,    -- boolean value (true <-> false)
    augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
  }
}

vim.keymap.set("n", "<Leader>a", require("dial.map").inc_normal("mygroup"), {noremap = true})


require("dial.config").augends:register_group{
  default = {
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.integer.new{
      radix = 16,
      prefix = "0x",
      natural = true,
      case = "upper",
    },
  },
}

require("dial.config").augends:register_group{
  default = {
    -- date with format `yyyy/mm/dd`
    augend.date.new{
        pattern = "%Y/%m/%d",
        default_kind = "day",
        -- if true, it does not match dates which does not exist, such as 2022/05/32
        only_valid = true,
        -- if true, it only matches dates with word boundary
        word = false,
    },
  },
}

require("dial.config").augends:register_group{
  default = {
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.constant.new{
      elements = {"and", "or"},
      word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true,  -- "or" is incremented into "and".
    },
    augend.constant.new{
      elements = {"&&", "||"},
      word = false,
      cyclic = true,
    },
  },
}

require("dial.config").augends:register_group{
  default = {
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.hexcolor.new{
      case = "lower",
    },
  },
}


require("dial.config").augends:register_group{
  default = {
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.user.new{
      find = require("dial.augend.common").find_pattern("%d+"),
      add = function(text, addend, cursor)
          local n = tonumber(text)
          n = math.floor(n * (2 ^ addend))
          text = tostring(n)
          cursor = #text
          return {text = text, cursor = cursor}
      end
    },
  },
}

require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
  },
}