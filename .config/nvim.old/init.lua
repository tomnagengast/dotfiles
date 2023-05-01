require('tnagengast')

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.g['dadbod#adapter#snowflaketest'] = {

}

-- function R(name)
--     require("plenary.reload").reload_module(name)
-- end

-- -- function Foo(bar)
-- --     print("foo")
-- -- end
-- -- vim.cmd("command! Foo lua Foo()")

-- -- trim trailing whitespace on save
-- autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

-- -- -- save the file on buffer leave
-- -- autocmd({ "BufLeave" }, {
-- --   pattern = { "*" },
-- --   command = [[update]],
-- -- })

-- -- -- add new line at the end of the file on save
-- -- autocmd({ "BufWritePost" }, {
-- --   pattern = { "*" },
-- --   command = [[%s/\n\+\%$//e]],
-- -- })
