return {
  config = function(_, opts)
    local icons = LazyVim.config.icons

    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = { left = "◤", right = "" },
        theme = "catpuccin",
        disabled_filetypes = {
          statusline = { "lazy", "alpha", "snacks_dashboard" },
          winbar = { "lazy", "alpha", "snacks_dashboard" },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {
          { "mode", separator = { left = "", right = "◤" } },
        },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    insert_left({
      "branch",
      icon = "",
      color = { fg = "#ebdbb2", gui = "bold" },
    })

    insert_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
    })

    insert_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
    })

    insert_left({
      function()
        return "%="
      end,
    })
    insert_right({ "location" })
    insert_right({ "lsp_status" })
    insert_right(Snacks.profiler.status())
    insert_right({
      function()
        return require("noice").api.status.command.get()
      end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.command.has()
      end,
      color = function()
        return { fg = Snacks.util.color("Statement") }
      end,
    })

    insert_right({
      -- stylua: ignore
        function() return require("noice").api.status.mode.get() end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.mode.has()
      end,
      color = function()
        return { fg = Snacks.util.color("Constant") }
      end,
    })

    insert_right({
      -- stylua: ignore
        function() return "  " .. require("dap").status() end,
      cond = function()
        return package.loaded["dap"] and require("dap").status() ~= ""
      end,
      color = function()
        return { fg = Snacks.util.color("Debug") }
      end,
    })

        -- stylua: ignore
      insert_right({
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = function() return { fg = Snacks.util.color("Special") } end,
      })

    insert_right({
      function()
        return ""
      end,
      color = { fg = "#ea6962" },
      padding = { right = 0 },
    })
    insert_right({ "filetype", color = { fg = "black", bg = "#ea6962", gui = "bold" } })
    insert_right({
      function()
        return ""
      end,
      color = { fg = "#ea6962" },
      padding = { left = 0 },
    })

    local auto = require("lualine.themes.auto")
    local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
    for _, field in ipairs(lualine_modes) do
      if auto[field] and auto[field].c then
        auto[field].c.bg = "#292929"
      end
    end
    config.options.theme = auto

    require("lualine").setup(config)
  end,
}
