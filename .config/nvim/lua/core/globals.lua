vim = vim
g = vim.g
cmd = vim.cmd
o, wo, bo = vim.o, vim.wo, vim.bo
buffer = {o, bo}
window = {o, wo}

-- startup: [1]
g.do_filetype_lua = 1

-- filetype.vim
g.did_load_filetypes = 1

-- matchup
g.loaded_matchit = 1

-- leaders
g.mapleader = [[\]]
g.maplocalleader = [[,]]

-- hide-virtual-text
vim.diagnostic.config({virtual_text = false})
