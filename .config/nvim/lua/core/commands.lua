-- theme
cmd([[colorscheme nord]])

-- syntax
-- cmd([[hi Conceal ctermbg=none]])
-- cmd([[filetype plugin indent on]])

-- cmd([[highlight CmpItemAbbr guibg=NONE guifg=White]])
-- cmd([[highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=Gray]])
-- cmd([[highlight CmpItemAbbrMatch guibg=NONE guifg=Gray]])
-- cmd([[highlight CmpItemMenu guibg=NONE guifg=Orange]])

-- cmd([[highlight DiagnosticFloatingError guibg=NONE]])
-- cmd([[highlight DiagnosticFloatingWarn guibg=NONE]])
-- cmd([[highlight DiagnosticFloatingInfo guibg=NONE]])
-- cmd([[highlight DiagnosticFloatingHint guibg=NONE]])

cmd([[highlight Title guifg=#f09483]])
-- cmd([[highlight diffRemoved guifg=#ec6a88]])
-- cmd([[highlight StartifyHeader guifg=#f09483]])

-- fzf: [4]
autocmd("fzf-acmds", [[FileType fzf tnoremap <buffer> <esc> <c-c>]], true)

-- LSP Diagnostics Options Setup 
local sign = function(opts)
    vim.fn.sign_define(opts.name,
                       {texthl = opts.name, text = opts.text, numhl = ''})
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
