vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TermEnter" }, {
  pattern = "term://*",
  callback = function()
    if vim.bo.buftype == "terminal" and vim.fn.mode() ~= "i" then
      vim.cmd("startinsert")
    end
  end,
})
