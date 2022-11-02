local vim, buffer = vim, buffer
local u = require("utils")

-- options
u.opt("syntax", true)
u.opt("wrap", false)
u.opt("title", true)
u.opt("spell", false)
u.opt("hidden", true)
u.opt("smarttab", true)
u.opt("hlsearch", true)
u.opt("showmatch", true)
u.opt("smartcase", true)
u.opt("incsearch", true)
u.opt("expandtab", true)
u.opt("showmode", false)
u.opt("copyindent", true)
u.opt("shiftround", true)
u.opt("ignorecase", true)
u.opt("splitbelow", true)
u.opt("splitright", true)
u.opt("autochdir", false)
u.opt("foldenable", false)
u.opt("errorbells", false)
u.opt("termguicolors", true)
u.opt("number", true)

-- values
u.opt("tabstop", 2)
u.opt("shiftwidth", 2)
u.opt("history", 1000)
u.opt("ttimeoutlen", 0)
u.opt("showtabline", 0)
u.opt("softtabstop", 2)
u.opt("scrolloff", 999)
u.opt("spelllang", "en")
u.opt("undolevels", 1000)
u.opt("encoding", "UTF-8")
u.opt("background", "dark")
u.opt("textwidth", 80, buffer)
u.opt("wildmode", "longest,full")
u.opt("clipboard", "unnamedplus") -- [2]
u.opt("backspace", "indent,eol,start")
u.opt("wildignore", [[node_modules/**,coverage/**,target/**,tmp/**,.git/,tags,]])

-- completion
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option('updatetime', 300)
