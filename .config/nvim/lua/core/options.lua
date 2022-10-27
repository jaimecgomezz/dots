-- options
opt("syntax", true)
opt("wrap", false)
opt("title", true)
opt("spell", false)
opt("hidden", true)
opt("smarttab", true)
opt("hlsearch", true)
opt("showmatch", true)
opt("smartcase", true)
opt("incsearch", true)
opt("expandtab", true)
opt("showmode", false)
opt("copyindent", true)
opt("shiftround", true)
opt("ignorecase", true)
opt("splitbelow", true)
opt("splitright", true)
opt("autochdir", false)
opt("foldenable", false)
opt("errorbells", false)
opt("termguicolors", true)
opt("number", true)
-- values
opt("tabstop", 2)
opt("shiftwidth", 2)
opt("history", 1000)
opt("ttimeoutlen", 0)
opt("showtabline", 0)
opt("softtabstop", 2)
opt("scrolloff", 999)
opt("conceallevel", 2)
opt("spelllang", "en")
opt("undolevels", 1000)
opt("encoding", "UTF-8")
opt("background", "dark")
opt("textwidth", 80, buffer)
opt("wildmode", "longest,full")
opt("clipboard", "unnamedplus") -- [2]
opt("backspace", "indent,eol,start")
opt("wildignore", [[node_modules/**,coverage/**,target/**,tmp/**,.git/,tags,]])
-- completion
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Treesitter folding 
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
