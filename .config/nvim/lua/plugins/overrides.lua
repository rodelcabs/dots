return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "<S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>x", "<cmd>lua Snacks.bufdelete()<cr>", desc = "close buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        tab_size = 20,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      picker = { enabled = false },
      explorer = { enabled = false },
      terminal = { enabled = false },
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 15, total = 250 },
          easing = "linear",
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = "linear",
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },
      dashboard = {
        preset = {
          header = [[
    __               _            
   / /_  ____  _____(_)___  ____ _
  / __ \/ __ \/ ___/ / __ \/ __ `/
 / /_/ / /_/ / /  / / / / / /_/ / 
/_.___/\____/_/  /_/_/ /_/\__, /  
                         /____/   
          ]],
          keys = {
            { icon = " ", key = "Ctrl-p", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "Ctrl-f", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "Space-f-o",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        inc_rename = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        pyright = {},
        cssls = {},
        html = {},
        ts_ls = {},
        jsonls = {},
        eslint = {},
      },
    },
  },
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gD", vim.lsp.buf.declaration }
      keys[#keys + 1] = { "gd", vim.lsp.buf.definition }
      keys[#keys + 1] = { "gi", vim.lsp.buf.implementation }
      keys[#keys + 1] = { "gl", '<cmd>lua vim.diagnostic.open_float({ scope = "line" })<CR>' }
      keys[#keys + 1] = { "<leader>sh", vim.lsp.buf.signature_help }
      keys[#keys + 1] = { "<leader>wa", vim.lsp.buf.add_workspace_folder }
      keys[#keys + 1] = { "<leader>wr", vim.lsp.buf.remove_workspace_folder }
      keys[#keys + 1] = { "gr", false }
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
      },
      keymap = {
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      completion = {
        menu = {
          border = "none",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDoc,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
        documentation = {
          window = {
            border = "none",
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDoc,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        git_branches = {
          initial_mode = "normal",
          previewer = false,
        },
        git_status = {
          initial_mode = "normal",
          path_display = { "tail" },
        },
        git_stash = {
          initial_mode = "normal",
        },
        git_commits = {
          initial_mode = "normal",
        },
        lsp_references = {
          initial_mode = "normal",
          path_display = { "tail" },
        },
        oldfiles = {
          initial_mode = "normal",
        },
      },
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
    },
    keys = {
      { "<leader>/", false },
    },
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = {
          with_markers = false,
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_by_name = {
            "node_modules",
          },
        },
      },
      source_selector = {
        winbar = true,
      },
      window = {
        mappings = {
          ["<Tab>"] = "next_source",
          ["<S-Tab>"] = "prev_source",
        },
      },
    },
  },
}
