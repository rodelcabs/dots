local M = {}

-- to set colorscheme more like vscode looking
M.setColorschemeOverrides = function()
  -- workaround for WinBar and WinBarNC
  vim.cmd("hi WinBar gui=NONE cterm=NONE")
  vim.cmd("hi WinBarNC gui=NONE cterm=NONE")
  -- Neo Tree overrides
  -- vim.cmd("hi NeoTreeNormal guibg=#181818")
  -- vim.cmd("hi NeoTreeNormalNC guibg=#181818")
  -- vim.cmd("hi NeoTreeWinSeparator guifg=#1f1f1f")
  -- vim.cmd("hi NeoTreeDimText guibg=NONE")
  -- vim.cmd("hi Directory guibg=#181818")

  -- bufferline overrides
  -- vim.cmd("hi BufferLineFill guibg=#1f1f1f")

  -- vim.cmd("hi VertSplit guibg=NONE")

  -- hide bufferline for more minimalism look
  vim.cmd("set showtabline=0")
end

return M
