return {
    "williamboman/mason.nvim"
},
{"williamboman/mason.nvim"},
{
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason").setup()
          require("mason-lspconfig").setup({})
        end,
},

{
        "ray-x/navigator.lua",
        requires = {
          { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
          { "neovim/nvim-lspconfig" },
          { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
          require("navigator").setup({
            mason = true,
          })
        end,
    }