vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("n", "<A-.>", '<cmd>Lspsaga code_action<CR>')
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>cp", vim.cmd.cprevious)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
