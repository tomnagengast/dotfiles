vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so") -- quick source
end)

-- Here's an example using iTerm2 on macOS:
-- 1. Open iTerm2 and go to Preferences (Cmd+,).
-- 2. Navigate to the Keys tab.
-- 3. Click the + button at the bottom of the Key Mappings section to add a new key mapping.
-- 4. For the new key mapping, input the desired key combination, for example, Cmd+]. In the "Action" dropdown, select "Send Escape Sequence" and enter an escape sequence like ] in the input box.
vim.keymap.set('n', '<Esc>]', '>>', {noremap = true, silent = false})
vim.keymap.set('n', '<Esc>[', '<<', {noremap = true, silent = false})
vim.keymap.set("v", "<Esc>]", ">gv", {noremap = true, silent = false})
vim.keymap.set('n', '<Esc>]', '>>', {noremap = true, silent = false})

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

-- delete into void (don't copy into the register)
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

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/.config/nvim/lua/tnagengast/packer.lua<CR>"); -- open packer.lua


