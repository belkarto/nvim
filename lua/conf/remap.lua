vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--indent the whole file
vim.keymap.set("n", "<leader>n", "gg=G<C-o>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<F3>", "<cmd>NvimTreeToggle<cr>")
vim.api.nvim_set_keymap('n', '<F1>', ': Ftheader<cr>', {noremap = true})
vim.keymap.set("n", "<leader>,", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<leader>.", "<Cmd>BufferNext<CR>")
