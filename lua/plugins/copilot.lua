local function SuggestOneCharacter()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return bar:sub(1, 1)
end
local function SuggestOneWord()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(bar,  [[[ .]\zs]])[1]
end
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false})
vim.g.copilot_no_tab_map = true

local map = vim.keymap.set
map('i', '<C-l>', SuggestOneCharacter, {expr = true, remap = false})
map('i', '<C-right>', SuggestOneWord, {expr = true, remap = false})

return{"github/copilot.vim",
config = function()
    local copilot_filetypes = {
      ['*'] = true
    }
  end
}
