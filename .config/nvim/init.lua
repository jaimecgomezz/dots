local modules = {
    "plugins", "globals", "options", "diagnostics", "commands", "mappings"
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)

    if not ok then error("Error loading " .. module .. ": " .. err) end
end

-- references
-- [1] https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
-- [2] https://www.reddit.com/r/neovim/comments/jzlbsw/how_can_i_copy_text_from_nvim_to_system_clipboard/
-- [3] https://vi.stackexchange.com/questions/3072/how-can-i-bind-ctrl-space-to-be-esc-when-not-in-insert-mode-and-to-switch-to-in
-- [4] https://github.com/junegunn/fzf/issues/1393
-- [5] https://github.com/wbthomason/dotfiles/tree/linux/neovim/.config/nvim
