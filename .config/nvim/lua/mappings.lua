local map = require("utils").map

-- silence mappings
local opts = {silent = true, noremap = true}

-- cmd-shortcut
map("n", ";", ":", opts)

-- window-movement
map("n", "<leader>wh", "<c-w>h")
map("n", "<leader>wj", "<c-w>j")
map("n", "<leader>wk", "<c-w>k")
map("n", "<leader>wl", "<c-w>l")
map("n", "<leader>wo", "<c-w>o")

-- window-split
map("n", "<c-s>", "<c-w><c-v>", opts)
map("n", "<c-t>", "<c-w><c-s>", opts)

-- tab-movement
map("n", "<c-Left>", "<cmd>tabpre<cr>")
map("n", "<c-Right>", "<cmd>tabnext<cr>")

-- buffers
map("n", "<leader>bs", "<cmd>silent w<cr>", opts)
map("n", "<leader>bn", "<cmd>enew<cr>", opts)
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts)
map("n", "<leader>bD", "<cmd>bdelete!<cr>", opts)
map("n", "<leader>bq", "<cmd>bufdo bwipeout<cr>", opts)
map("n", "<leader>bw", "<cmd>echo expand('%:p')<cr>", opts)

-- project
map("n", "<leader>pw", "<cmd>pwd<cr>", opts)

-- nvim
map("n", "<leader>vq", "<cmd>qa<cr>", opts)
map("n", "<leader>vQ", "<cmd>qa!<cr>", opts)
map("n", "<localleader>ve",
    "<cmd>cd ~/.config/nvim<cr><cmd>:e ~/.config/nvim/init.lua<cr>", opts)

-- lines-movement
map("n", "<C-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<C-k>", "<cmd>m .-2<cr>==", opts)
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", opts)
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", opts)
map("v", "<C-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<cr>gv=gv", opts)

-- filer
map("n", "<localleader>ff", "<cmd>NvimTreeToggle<cr>", opts)
map("n", "<localleader>fb", "<cmd>NvimTreeFindFileToggle<cr>", opts)

-- projects
map("n", "<leader>pp", "<cmd>FzfSwitchProject<cr>", opts)

-- pickers
map("n", "z=", "<cmd>Telescope spell_suggest<cr>", opts)
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope filetypes<cr>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope colorscheme<cr>", opts)
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<c-p>", "<cmd>Telescope find_files hidden=true<cr>", opts)
map("n", "<leader>fe", "<cmd>Telescope env theme=dropdown<cr>", opts)
map("n", "<leader>ff", "<cmd>Telescope live_grep hidden=true<cr>", opts)
map("n", "<c-space>",
    "<cmd>Telescope buffers previewer=false sort_mru=true ignore_current_buffer=true<cr>",
    opts)

-- startify
map("n", "<leader>vs", "<cmd>Startify<cr>", opts)

-- fugitive
map("n", "<leader>gg", "<cmd>vert Git<cr>", opts)
map("n", "<leader>gl", "<cmd>vert Git log<cr>", opts)

-- tagbar
map("n", "<localleader>tt", "<cmd>TagbarToggle<cr>", opts)

-- toggleterm
map("t", "<leader>wh", [[<C-\><C-n><C-W>h]], opts)
map("t", "<leader>wj", [[<C-\><C-n><C-W>j]], opts)
map("t", "<leader>wk", [[<C-\><C-n><C-W>k]], opts)
map("t", "<leader>wl", [[<C-\><C-n><C-W>l]], opts)
map("t", "<leader>tk", [[<C-\><C-n><cmd>bd!<cr>]], opts)

-- diffview
map("n", "<localleader>dd", "<cmd>DiffviewOpen<cr>", opts)
map("n", "<localleader>dp", "<cmd>DiffviewFileHistory<cr>", opts)
map("n", "<localleader>df", "<cmd>DiffviewFileHistory %<cr>", opts)
map("n", "<localleader>dD", "<cmd>DiffviewClose<cr>", opts)
map("n", "<localleader>dr", "<cmd>DiffviewRefresh<cr>", opts)

-- inskape-figures
vim.cmd([[
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]])
