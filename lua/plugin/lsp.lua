return {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies  = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
  },
  {'nvim-lua/lsp-status.nvim'},
  {'nvimdev/lspsaga.nvim'},
  { 'kosayoda/nvim-lightbulb' },
  {
  "roobert/action-hints.nvim",
  config = function()
    require("action-hints").setup({
		 template = {
        definition = { text = " ⊛", color = "#add8e6" },
        references = { text = " ↱%s", color = "#ff6666" },
      },
      use_virtual_text = true,
	})
  end,
},
{'onsails/lspkind'},
{
  'ojroques/nvim-lspfuzzy',
  dependencies = {
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},  -- to enable preview (optional)
  },
},
{
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
},
{
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
},
{
    'ray-x/navigator.lua',
    dependencies = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
},
{'simrat39/symbols-outline.nvim'},
{
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",        -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
    }
},
{'mfussenegger/nvim-lint'}
