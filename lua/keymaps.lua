local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Save / quit
map("n", "<C-s>", "<cmd>write<CR>", opts)
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit all" })
map("n", "<leader>W", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })

-- Buffer management
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bufdo bdelete<CR>", { desc = "Delete all buffers" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bf", "<cmd>bfirst<CR>", { desc = "First buffer" })
map("n", "<leader>bl", "<cmd>blast<CR>", { desc = "Last buffer" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Window management
map("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
map("n", "<leader>sm", "<cmd>only<CR>", { desc = "Maximize current split" })

-- Tab management
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close other tabs" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tf", "<cmd>tabfirst<CR>", { desc = "First tab" })
map("n", "<leader>tl", "<cmd>tablast<CR>", { desc = "Last tab" })
map("n", "<leader>tm", "<cmd>tabmove<CR>", { desc = "Move tab" })

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Keep cursor centered
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "*", "*zzzv", opts)
map("n", "#", "#zzzv", opts)
map("n", "g*", "g*zzzv", opts)
map("n", "g#", "g#zzzv", opts)

-- Better paste (don't overwrite register)
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)

-- Quickfix / location list
map("n", "<leader>co", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
map("n", "<leader>cn", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "<leader>cp", "<cmd>cprevious<CR>", { desc = "Previous quickfix" })
map("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open location list" })
map("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close location list" })

-- Search
map("n", "<leader>ss", "<cmd>%s/\\<<C-r><C-w>\\>//g<left><left>", { desc = "Search/replace word under cursor" })

-- Registers
map("n", "<leader>rr", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>ry", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>ry", '"+y', { desc = "Yank to system clipboard" })

-- Terminal mode escape
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "jk", "<C-\\><C-n>", opts)

-- Undo tree
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo tree" })

-- Toggle options
map("n", "<leader>ul", function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle line numbers" })
map("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Diagnostics
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle trouble" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace diagnostics" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document diagnostics" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Location list" })
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", { desc = "LSP references" })

-- Double space for quick file search (Helix-style)
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files (fzf)" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Grep string" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Projects" })
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Treesitter symbols" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in buffer" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "Git status" })
map("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "Git diff" })
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
map("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
map("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Git log" })
map("n", "<leader>gL", "<cmd>Git log --oneline --graph --all -30<CR>", { desc = "Git log graph" })
map("n", "<leader>gh", "<cmd>diffget //3<CR>", { desc = "Git: accept theirs" })
map("n", "<leader>gm", "<cmd>diffget //2<CR>", { desc = "Git: accept mine" })

-- LSP (see lsp.lua for buffer-local mappings)
map("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LSP info" })
map("n", "<leader>ll", "<cmd>LspLog<CR>", { desc = "LSP log" })
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "LSP restart" })

-- Mason
map("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })

-- Alpha / Dashboard
map("n", "<leader>aa", "<cmd>Alpha<CR>", { desc = "Open dashboard" })
