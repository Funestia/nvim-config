vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<A-.>", '<cmd>Lspsaga code_action<CR>')
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>cp", vim.cmd.cprevious)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({'n', 'v', 'i'}, '<leader>kr', function() require("knap").process_once() end)
vim.keymap.set({'n', 'v', 'i'}, '<leader>kc', function() require("knap").close_viewer() end)
vim.keymap.set({'n', 'v', 'i'}, '<leader>ka', function() require("knap").toggle_autopreviewing() end)
vim.keymap.set({'n', 'v', 'i'}, '<leader>ksn', function() require("knap").forward_jump() end)
