-- silence mappings
local opts = { silent = true, noremap = true }

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
map("n", "<leader>ve", "<cmd>e ~/.config/nvim/init.lua<cr>", opts)
map("n", "<leader>vr", "<cmd>so ~/.config/nvim/init.lua<cr>", opts)

-- lines-movement [3]
map("n", "<C-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<C-k>", "<cmd>m .-2<cr>==", opts)
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", opts)
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", opts)
map("v", "<C-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<C-k>", ":m '<-2<cr>gv=gv", opts)