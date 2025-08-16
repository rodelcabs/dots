return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({})
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      on_open = function(_)
        local manager = require("neo-tree.sources.manager")
        local renderer = require("neo-tree.ui.renderer")

        local state = manager.get_state("filesystem")
        local window_exists = renderer.window_exists(state)

        if window_exists then
          vim.defer_fn(function()
            local cmd = string.format("Neotree toggle")
            vim.cmd(cmd)
            vim.cmd(cmd)
            vim.cmd("wincmd p")
          end, 100)
        end
      end,
      highlights = {
        Normal = {
          link = "Normal",
        },
      },
      start_in_insert = true,
      insert_mappings = true,
      persist_mode = false,
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      window = {
        width = 0.3,
      },
    },
  },
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "css",
        js = { names = false },
        lua = { names = false },
        markdown = { names = false },
        text = { names = false },
      },
    },
  },
}
