local modules = {
    "plugins", "globals", "options", "diagnostics", "commands", "mappings",
    "colors"
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)

    if not ok then error("Error loading " .. module .. ": " .. err) end
end
