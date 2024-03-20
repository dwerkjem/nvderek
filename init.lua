require("nvd.config")
vim.cmd.colorscheme("sonokai")
-- set the neovim welcome message to be tips.txt
local function read_tips()
  local tips = {}
  local file = io.open(vim.fn.stdpath("config") .. "/tips.txt", "r")
  if file then
    for line in file:lines() do
      table.insert(tips, line)
    end
    file:close()
  end
  return tips
end

local tips = read_tips()
-- relitive line numbers
vim.wo.relativenumber = true
vim.g.startify_custom_header = tips
