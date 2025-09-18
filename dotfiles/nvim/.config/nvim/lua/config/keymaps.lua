-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Show hover information" })
vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Go to Symbol" })
