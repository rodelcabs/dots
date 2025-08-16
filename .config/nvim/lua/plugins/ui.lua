return {
  {
    "EdenEast/nightfox.nvim",
    config = require("config.ui").nightfox,
  },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "arzg/vim-colors-xcode" },
  { "shaunsingh/nord.nvim" },
  { "vague2k/vague.nvim" },
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  {
    "mcauley-penney/phobos-anomaly.nvim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = require("config.ui").catppuccin,
  },
  {
    "lunacookies/vim-substrata",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "terafox",
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
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {},
    },
    config = require("config.lualine").config,
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
}
