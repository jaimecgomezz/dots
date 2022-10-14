local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

local modules = {
	"utils",
    "globals",
	"options",
    "mappings",
    "commands",
    "plugins",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, "core." .. module)

	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end