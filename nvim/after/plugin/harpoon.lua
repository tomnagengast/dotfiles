local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon.mark:add_file() end)
vim.keymap.set("n", "<C-p>", function() harpoon.ui:toggle_quick_menu() end)

vim.keymap.set("n", "<C-j>", function() harpoon.ui:nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon.ui:nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon.ui:nav_file(3) end)
vim.keymap.set("n", "<C-;>", function() harpoon.ui:nav_file(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-R>", function() harpoon.ui:nav_prev() end)
vim.keymap.set("n", "<C-S-B>", function() harpoon.ui:nav_next() end)

