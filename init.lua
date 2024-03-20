require("nvd.config")

-- print the contents of tips.txt if and only if it is not empty
local file = io.open("tips.txt", "r")
if file then
    local contents = file:read("*a")
    if contents ~= "" then
	print(contents)
    end
    file:close()
end

