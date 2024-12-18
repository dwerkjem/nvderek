-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- In your init.lua or main configuration file
require("nvim-treesitter.configs").setup({
  ensure_installed = { "r", "markdown", "rnoweb", "yaml" },
  highlight = {
    enable = true,
  },
})
