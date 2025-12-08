return {
  -- disable other themes
  { "folke/tokyonight.nvim", enabled = false },
  { "projekt0n/github-nvim-theme", enabled = false },
  { "olimorris/onedarkpro.nvim", enabled = false },
  { "Shatur/neovim-ayu", enabled = false },

  -- toggle theme
  {
    "eliseshaffer/darklight.nvim",
    dependencies = {
      -- load gruvbox theme
      { "ellisonleao/gruvbox.nvim" },
    },
    opts = {
      mode = "colorscheme",
      dark_mode_colorscheme = "gruvbox",
      light_mode_colorscheme = "gruvbox",
    },
  },

  -- Configure LazyVim to load gruvbox theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local theme = require("gruvbox")
        local opts = {
          terminal_colors = true,
          undercurl = true,
          underline = true,
          bold = true,
          italic = {
            strings = false,
            comments = false,
            operators = false,
            folds = false,
          },
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = false,
          invert_intend_guides = false,
          inverse = true,
          contrast = "", -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = false,
        }
        theme.setup(opts)
        vim.cmd("colorscheme gruvbox")
      end,
    },
  },
}
