
local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

local modules = {
	"globals",
	"plugins",
	"utils",
	"options",
	"commands",
	"mappings",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, "core." .. module)

	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
