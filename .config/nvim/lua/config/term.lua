-- simple term implementation

local cmd = vim.cmd

local function open_term_split(mode, command)
  command = command or vim.o.shell

  local buf = vim.api.nvim_create_buf(false, true) -- unlisted scratch buffer
  local win

  if mode == "float" then
    -- Floating terminal dimensions
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
      style = "minimal",
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      border = "rounded",
    }
    win = vim.api.nvim_open_win(buf, true, opts)
  elseif mode == "v" then
    vim.cmd("vsplit")
    win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
  else -- default horizontal
    vim.cmd("split")
    vim.cmd("resize 15") -- custom height
    win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
  end

  -- Start terminal with auto-close
  vim.fn.termopen(command, {
    on_exit = function(_, _, _)
      if win and vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd("startinsert")
end

-- tidy up looks
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

return {
  open_term = open_term_split,
}
