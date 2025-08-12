-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- window navigation
map({ "n", "v" }, "<C-h>", "<C-w>h", opts)
map({ "n", "v" }, "<C-j>", "<C-w>j", opts)
map({ "n", "v" }, "<C-k>", "<C-w>k", opts)
map({ "n", "v" }, "<C-l>", "<C-w>l", opts)

-- map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
-- map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
-- map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
-- map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })
-- map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true })

-- exlorer
vim.keymap.del("n", "<leader>e") -- unmap the default toggle
map("n", "<C-n>", "<cmd>lua require('neo-tree.command').execute({toggle=true})<cr>")

--new window vertical
map("n", "<leader>v", "<C-w>v")
--window horizontal
map("n", "<leader>h", "<C-w>s")

-- renamer
map("n", "<leader>rn", ":IncRename ", { silent = true })

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

--gitsigns
map("n", "gh", "<cmd>Gitsigns next_hunk<cr>", opts)
map("n", "gH", "<cmd>Gitsigns prev_hunk<cr>", opts)
map("n", "gp", "<cmd>Gitsigns preview_hunk<cr>", opts)
map("n", "gw", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)

-- remove mapping copying the whole file
map("n", "<C-c>", "")

--terminal
map("n", "<leader>H", "<cmd>ToggleTerm size=23<CR>")
map("n", "<leader>V", "<cmd>ToggleTerm size=50 direction=vertical<CR>")
map("n", "<C-\\>", "<cmd>ToggleTerm direction=float<CR>")
map("t", "<ESC>", "<C-\\><C-N>", opts)
map("t", "<C-h>", "<ESC><C-h>", opts)
map("t", "<C-j>", "<ESC><C-j>", opts)
map("t", "<C-k>", "<ESC><C-k>", opts)
map("t", "<C-l>", "<ESC><C-l>", opts)

-- copilot
map("n", "<leader>c", "<cmd>CopilotChat<cr>", opts)

map("n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "hover symbol" })

-- telescope
map(
  "n",
  "<C-p>",
  "<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
)
map(
  "i",
  "<C-p>",
  "<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
)
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>")
map("n", "<Leader>fo", "<cmd>Telescope oldfiles<cr>")
map(
  "n",
  "gr",
  "<cmd> lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_cursor({layout_config = {width = 0.75, height = 0.20}}))<cr>"
) --use telescope for lsp references

-- git telescope
map("n", "<leader>gt", "<cmd>Telescope git_status<cr>", opts) --gt status
map(
  "n",
  "<leader>gb",
  "<cmd> lua require'telescope.builtin'.git_branches(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
) -- git branches
map("n", "<leader>gs", "<cmd>Telescope git_stash<cr>", opts) -- git stash
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts) -- git commits

-- enable/disable indent lines
map("n", "<leader>i", "<cmd>lua Snacks.indent.disable()<cr>")
map("n", "<leader>I", "<cmd>lua Snacks.indent.enable()<cr>")
