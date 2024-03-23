local function is_package_installed(package_name)
	local mason_package_path = vim.fn.stdpath("data") .. "/mason/packages/" .. package_name
	return vim.fn.isdirectory(mason_package_path) ~= 0
end

local function install_package(package_name)
	-- Use vim.api.nvim_exec to execute the MasonInstall command and capture any errors
	local ok, err = pcall(function()
		vim.api.nvim_command("MasonInstall " .. package_name)
	end)

	if not ok then
		print("Error installing " .. package_name .. ": " .. err)
	else
		print(package_name .. " installed successfully.")
	end
end

local mason_packages = {
	"pyright",
	"lua-language-server",
	"stylua",
	"html-lsp",
	"pylint",
	"flake8",
	"black",
	"isort",
	"prettier",
	"shellcheck",
	"gitlint",
	"selene",
	"vint",
}

local function ensure_packages_installed()
	for _, package in ipairs(mason_packages) do
		if not is_package_installed(package) then
			print("Installing " .. package .. "...")
			install_package(package)
		else
		end
	end
end

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
			ensure_packages_installed()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = { "tsserver", "html", "lua_ls", "pyright" },
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- Diagnostics should appear when cursor hovers over the line
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = false,
					signs = true,
					update_in_insert = true,
				})
		end,
	},
}
