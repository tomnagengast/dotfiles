vim.opt.guicursor = "" -- disable cursor blink

vim.opt.nu = true -- set line numbers
vim.opt.relativenumber = true -- set relative line numbers

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- don't do backup files, but undo should have access to a long running history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- use good colors
vim.opt.termguicolors = true

-- fast update time
vim.opt.updatetime = 50
