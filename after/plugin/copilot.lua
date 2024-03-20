local function SuggestOneCharacter()
	local suggestion = vim.fn["copilot#Accept"]("")
	local bar = vim.fn["copilot#TextQueuedForInsertion"]()
	return bar:sub(1, 1)
end
local function SuggestOneWord()
	local suggestion = vim.fn["copilot#Accept"]("")
	local bar = vim.fn["copilot#TextQueuedForInsertion"]()
	return vim.fn.split(bar, [[[ .]\zs]])[1]
end

local map = vim.keymap.set
map("i", "<C-l>", SuggestOneCharacter, { expr = true, remap = false })
map("i", "<C-right>", SuggestOneWord, { expr = true, remap = false })
vim.g.copilot_filetypes = { markdown = true, txt = true, teal = true, ["*"] = true }
