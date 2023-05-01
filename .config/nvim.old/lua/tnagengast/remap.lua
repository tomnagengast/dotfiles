-- https://gist.github.com/JeffreyWay/6753834
-- https://laracasts.com/series/neovim-as-a-php-ide
-- https://github.com/ThePrimeagen/init.lua

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- quick source
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-[>", "<<")
vim.keymap.set("n", "<C-]>", ">>")
vim.keymap.set("v", "<C-[>", "<gv")
vim.keymap.set("v", "<C-]>", ">gv")

-- when text is selected, J and K will move the line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- append next line to current line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle of the screen when page down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle of the screen when page up
vim.keymap.set("n", "n", "nzzzv") -- keep cursor in the middle of the screen when search up
vim.keymap.set("n", "N", "Nzzzv") -- keep cursor in the middle of the screen when search down

-- greatest remap ever, paste and keepthe register so you can keep pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever: yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>") -- disable ex mode
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- change the languages format of the file

-- quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace under cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make file executable

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/tnagengast/packer.lua<CR>"); -- open packer.lua

