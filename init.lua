require("nvd.config")

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
vim.g.startify_custom_header = tips
