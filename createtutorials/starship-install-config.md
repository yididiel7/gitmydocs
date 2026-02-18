# STARSHIP Configurations

Main install command

$ zimfw install

This is a Prompt Command for Starship

# zmodule spaceship-prompt/spaceship-prompt --name spaceship

{
      "L3MON4D3/LuaSnip",
   },
   {
      "hrsh7th/nvim-cmp",
   },
  config = function ()
    require'cmp'.setup {
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'luasnip' },  -- more sources
    },
  }
  end,
  {
    "saadparwaiz1/cmp_luasnip",
  },
