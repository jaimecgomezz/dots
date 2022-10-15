-- theme
cmd([[colorscheme horizon]])

-- syntax
cmd([[hi Conceal ctermbg=none]])
cmd([[filetype plugin indent on]])

-- fzf: [4]
autocmd("fzf-acmds", [[FileType fzf tnoremap <buffer> <esc> <c-c>]], true)
