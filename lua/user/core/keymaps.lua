local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- INFO: window management
-- Better window navigation
opts.desc = "Move to window on left"
keymap("n", "<C-h>", "<C-w>h", opts)
opts.desc = "Move to window on buttom"
keymap("n", "<C-j>", "<C-w>j", opts)
opts.desc = "Move to window on top"
keymap("n", "<C-k>", "<C-w>k", opts)
opts.desc = "Move to window on right"
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
opts.desc = "Resize window"
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
opts.desc = "Resize window"
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
opts.desc = "Resize window"
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
opts.desc = "Resize window"
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

opts.desc = "Find file"
keymap(
	"n",
	"<leader>tf",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
opts.desc = "Live grep"
keymap("n", "<leader>ts", "<cmd>Telescope live_grep<cr>", opts)
opts.desc = "Live colorscheme changing"
keymap("n", "<leader>tc", "<cmd>lua require'telescope.builtin'.colorscheme({ enable_preview = true })<cr>", opts)

-- find all matching words and replace them
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- clear all search highlight
keymap("n", "<leader>c", "<cmd>noh<cr>", opts)

vim.keymap.set("n", "<leader>dd", "<cmd>packadd termdebug<cr><cmd>Termdebug<cr><C-w>k<C-w>k<C-w>L<C-w>h<C-w>j", opts)
