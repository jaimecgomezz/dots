local cmd = vim.cmd
local theme = "paradise"

local present, base16 = pcall(require, "base16-colorscheme")
if not present then return end

local ok, err = pcall(cmd, ("colorscheme " .. theme))
if not ok then
    local u = require("utils")
    local cpresent, color = pcall(require, "colors." .. theme)

    if cpresent then
        base16.setup(color)
    else
        color = require("colors.paradise")
        base16.setup(color)
        print(err)
    end

    -- Status Line
    u.hl("StatusNormal")
    u.hl("StatusLineNC", color.base03)
    u.hl("StatusActive", color.base05)
    u.hl("StatusLine", color.base02)
    u.hl("StatusReplace", color.base08)
    u.hl("StatusInsert", color.base0B)
    u.hl("StatusCommand", color.base0A)
    u.hl("StatusVisual", color.base0D)
    u.hl("StatusTerminal", color.base0E)

    -- Nvim Tree
    u.hl("NvimTreeFolderName", color.base05)
    u.hl("NvimTreeOpenedFolderName", color.base05)
    u.hl("NvimTreeEmptyFolderName", color.base05)
    u.hl("NvimTreeFolderIcon", color.base03)
    u.hl("NvimTreeGitDirty", color.base08)
    u.hl("NvimTreeGitNew", color.base0B)
    u.hl("NvimTreeGitDeleted", color.base08)
    u.hl("NvimTreeGitRenamed", color.base0A)
    u.hl("NvimTreeGitExecFile", color.base0B)
    u.hl("NvimTreeSpecialFile", color.base0E)
    u.hl("NvimTreeImageFile", color.base0C)
    u.hl("NvimTreeWindowPicker", color.base05, color.base01)
    u.hl("NvimTreeIndentMarker", color.base03)

    -- Telescope
    u.hl("TelescopePromptBorder", color.base01, color.base01)
    u.hl("TelescopePromptNormal", nil, color.base01)
    u.hl("TelescopePromptPrefix", color.base08, color.base01)
    u.hl("TelescopeSelection", nil, color.base01)

    -- Menu
    u.hl("Pmenu", nil, color.base01)
    u.hl("PmenuSbar", nil, color.base01)
    u.hl("PmenuThumb", nil, color.base01)
    u.hl("PmenuSel", nil, color.base02)

    -- CMP
    u.hl("CmpItemAbbrMatch", color.base05)
    u.hl("CmpItemAbbrMatchFuzzy", color.base05)
    u.hl("CmpItemAbbr", color.base03)
    u.hl("CmpItemKind", color.base0E)
    u.hl("CmpItemMenu", color.base0E)
    u.hl("CmpItemKindSnippet", color.base0E)

    -- Number
    u.hl("CursorLine")
    u.hl("CursorLineNR")
    u.hl("LineNr", color.base03)

    -- Others
    u.hl("VertSplit", color.base01, nil)
    u.hl("NormalFloat", nil, color.base01)
    u.hl("FloatBorder", color.base01, color.base01)

    -- Comments
    u.hl("Comment", color.base04)

    -- Extra
    cmd("hi StatusLine gui=strikethrough")
end
