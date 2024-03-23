-- Function to check if a Mason package is installed
local function is_package_installed(package_name)
  local result = vim.fn.system("mason list | grep '" .. package_name .. "'")
  return result ~= ""
end

-- Function to install a Mason package
local function install_package(package_name)
  vim.fn.system("mason install " .. package_name)
end

-- Define a list of Mason packages to be installed
local mason_packages = {
  "lua-ls",
  "tsserver",
  "html",
  "pyright",
  "solargraph",
  "eslint",
  "prettier",
  "pylint",
  "flake8",
  "lua-language-server",

}

-- Main function to ensure all Mason packages are installed
local function ensure_packages_installed()
  for _, package in ipairs(mason_packages) do
    if not is_package_installed(package) then
      print("Installing " .. package .. "...")
      install_package(package)
    else
    end
  end
end

-- Call the main function to ensure all Mason packages are installed
ensure_packages_installed()

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
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
