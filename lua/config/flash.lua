require("flash").jump({
  remote_op = {
    restore = true,
    motion = true,
  },
})

require("flash").jump({
  action = function(match, state)
    vim.api.nvim_win_call(match.win, function()
      vim.api.nvim_win_set_cursor(match.win, match.pos)
      vim.diagnostic.open_float()
    end)
    state:restore()
  end,
})

-- More advanced example that also highlights diagnostics:
require("flash").jump({
  matcher = function(win)
    ---@param diag Diagnostic
    return vim.tbl_map(function(diag)
      return {
        pos = { diag.lnum + 1, diag.col },
        end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
      }
    end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
  end,
  action = function(match, state)
    vim.api.nvim_win_call(match.win, function()
      vim.api.nvim_win_set_cursor(match.win, match.pos)
      vim.diagnostic.open_float()
    end)
    state:restore()
  end,
})


require("flash").jump({
  search = {
    mode = function(str)
      return "\\<" .. str
    end,
  },
})

require("flash").jump({
  pattern = vim.fn.expand("<cword>"),
})

require("flash").jump({
  search = { mode = "search", max_length = 0 },
  label = { after = { 0, 0 } },
  pattern = "^"
})

require("flash").jump({
  pattern = ".", -- initialize pattern with any char
  search = {
    mode = function(pattern)
      -- remove leading dot
      if pattern:sub(1, 1) == "." then
        pattern = pattern:sub(2)
      end
      -- return word pattern and proper skip pattern
      return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
    end,
  },
  -- select the range
  jump = { pos = "range" },
})



  local function flash(prompt_bufnr)
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        })
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { s = flash },
          i = { ["<c-s>"] = flash },
        },
      })


local Flash = require("flash")

---@param opts Flash.Format
local function format(opts)
  -- always show first and second label
  return {
    { opts.match.label1, "FlashMatch" },
    { opts.match.label2, "FlashLabel" },
  }
end

Flash.jump({
  search = { mode = "search" },
  label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
  pattern = [[\<]],
  action = function(match, state)
    state:hide()
    Flash.jump({
      search = { max_length = 0 },
      highlight = { matches = false },
      label = { format = format },
      matcher = function(win)
        -- limit matches to the current label
        return vim.tbl_filter(function(m)
          return m.label == match.label and m.win == win
        end, state.results)
      end,
      labeler = function(matches)
        for _, m in ipairs(matches) do
          m.label = m.label2 -- use the second label
        end
      end,
    })
  end,
  labeler = function(matches, state)
    local labels = state:labels()
    for m, match in ipairs(matches) do
      match.label1 = labels[math.floor((m - 1) / #labels) + 1]
      match.label2 = labels[(m - 1) % #labels + 1]
      match.label = match.label1
    end
  end,
})