vim.opt.guicursor = "" -- disable cursor blink

vim.opt.number = true -- set line numbers
vim.opt.relativenumber = true -- set relative line numbers

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false -- :set nowrap or :set wrap

vim.opt.wildmode = 'longest:full,full'
vim.opt.title = true
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars:append({ eob = " " })

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

vim.opt.clipboard = 'unnamedplus'

vim.opt.confirm = true

-- don't do backup files, but undo should have access to a long running history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- use good colors
vim.opt.termguicolors = true

-- fast update time
vim.opt.updatetime = 50

-- block cursor unless in insert mode
vim.opt.guicursor = {
  'n:block',
  'i:ver25',
  'v:block',
  'c:block',
}

