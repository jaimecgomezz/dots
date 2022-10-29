local vim = vim
local u = require('utils')

-- theme
vim.cmd([[colorscheme nord]])

-- fzf
u.autocmd("fzf-acmds", [[FileType fzf tnoremap <buffer> <esc> <c-c>]], true)
