local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local unprepared_pickers = {
    "buffers", "commands", "command_history", "search_history", "man_pages",
    "colorscheme", "registers", "spell_suggest", "keymaps", "filetypes",
    "highlights", "pickers"
}

local pickers = {}
for _, picker in pairs(unprepared_pickers) do
    pickers[picker] = {theme = "dropdown"}
end

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules", "coverage", "target", "tmp", ".git", "tags",
            "*.lock", ".local", ".cache"
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<M-p>"] = action_layout.toggle_preview
            },
            n = {["<M-p>"] = action_layout.toggle_preview}
        },
        vimgrep_arguments = {"ag", "--vimgrep", "--hidden"}
    },
    pickers = pickers
})
