return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
								"",
								true
							)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
								"",
								true
							)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "calc" },
					{ name = "emoji" },
					{ name = "treesitter" },
					{ name = "spell" },
					{ name = "tags" },
					{ name = "path" },
					cmp.setup({
						sources = {
							{
								name = "buffer",
								options = {
									get_bufnrs = function()
										return vim.api.nvim_list_bufs()
									end,
								},
							},
						},
					}),
					{
						name = "spell",
						option = {
							keep_all_entries = false,
							enable_in_context = function()
								return true
							end,
						},
					},
					{ name = "latex" },
					{ name = "luasnip" }, -- For luasnip users.
				}),
			})
		end,
	},
}
