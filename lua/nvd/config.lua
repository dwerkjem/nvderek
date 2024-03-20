require("nvd.remap")
require("nvd.packer")
-- make sure to run :PackerSync after adding new plugins
-- make nvim tree default file explorer
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1

-- This is the time you have to wait for a mapped sequence to complete.
vim.o.timeoutlen = 10000

