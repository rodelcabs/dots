return {
  config = function(_, opts)
    local icons = LazyVim.config.icons

    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = { left = "", right = "" },
        theme = "catpuccin",
        disabled_filetypes = {
          statusline = { "lazy", "alpha", "snacks_dashboard", "terminal" },
          winbar = { "lazy", "alpha", "snacks_dashboard", "terminal" },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {
          -- { "fileName", separator = { left = "", right = "◤" } },
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

    insert_left({ "filetype", icon_only = true, padding = { left = 3, right = 0 } })
    insert_left({
      "filename",
      color = { fg = "#587b7b" },
      padding = { left = 0, right = 3 },
    })

    insert_left({
      "branch",
      icon = "",
      color = { fg = "#657783" },
    })

    insert_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
    })

    insert_right({ "location" })
    insert_right({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
    })

    insert_left({
      function()
        return "%="
      end,
    })
    insert_right({
      "lsp_status",
      padding = { left = 3, right = 3 },
      color = { fg = "#657783" },
    })

    local auto = require("lualine.themes.auto")
    local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
    for _, field in ipairs(lualine_modes) do
      if auto[field] and auto[field].c then
        auto[field].c.bg = "#171a1c"
      end
    end
    config.options.theme = auto

    require("lualine").setup(config)
  end,
}
