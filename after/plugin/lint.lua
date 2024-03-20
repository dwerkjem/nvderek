require("lint").linters_by_ft = {
	lua = { "selene" },
	python = { "flake8", "mypy" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.keymap.set("n", "<leader>ll", function()
	require("lint").try_lint()
end)
