vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = true
-- disable default file manager for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- allow colours for colorizer
vim.opt.termguicolors = true

require("config.lazy")

