local opts = {
    scope = 'line',
    modes = { 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx' },
    blending = {
        threshold = 0.75,
        colorcode = '#000000',
        hlgroup = {
            'Normal',
            'background',
        },
    },
    warning = {
        alpha = 0.4,
        offset = 0,
        colorcode = '#FF0000',
        hlgroup = {
            'Error',
            'background',
        },
    },
    extra = {
        follow_tw = nil,
    },
}

require('deadcolumn').setup(opts) -- Call the setup function


  require('deadcolumn').setup({
      scope = function()
          local max = 0
          for i = -50, 50 do
              local len = vim.fn.strdisplaywidth(vim.fn.getline(vim.fn.line('.') + i))
              if len > max then
                  max = len
              end
          end
          return max
      end
  })

  require('deadcolumn').setup({
    blending = {
        colorcode = '#1F2430',
        hlgroup = {
            'NonText',
            'background',
        },
    },
})