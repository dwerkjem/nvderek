require("nvd.config")

-- print the contents of tips.txt
local file = io.open("tips.txt", "r")
print(file:read("*a"))
file:close()

