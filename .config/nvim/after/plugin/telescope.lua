local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {["<esc>"] = actions.close},
        },
    },
})

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

