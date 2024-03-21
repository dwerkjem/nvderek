require("mason").setup()
require("mason-lspconfig").setup()
vim.keymap.set("n", "<leader>om", "<cmd>Mason<cr>")

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer" },
	automatic_install = true,
})
