return {
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "arzg/vim-colors-xcode" },
  { "shaunsingh/nord.nvim" },
  { "vague2k/vague.nvim" },
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = require("config.catppuccin"),
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      defaults = {
        keymaps = false,
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      group_overrides = {},
    },
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "SmiteshP/nvim-navic",
    opts = {
      depth_limit = 0,
      highlight = true,
    },
  },
  {
    "LunarVim/breadcrumbs.nvim",
    opts = function()
      require("breadcrumbs").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {},
    },
    config = require("config.lualine").config,
  },
}
