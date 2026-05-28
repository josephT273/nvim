local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("general", { clear = true })

local project = augroup("project", { clear = true })

autocmd("VimEnter", {
  group = project,
  desc = "Open Telescope file picker when starting with a directory",
  once = true,
  callback = function()
    if vim.fn.argc() == 1 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        vim.schedule(function()
          vim.cmd("Telescope find_files")
        end)
      end
    end
  end,
})

autocmd("TextYankPost", {
  group = general,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

autocmd("BufWritePre", {
  group = general,
  desc = "Trim trailing whitespace on save",
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

autocmd("FileType", {
  group = general,
  desc = "Close certain filetypes with q",
  pattern = { "qf", "help", "man", "notify", "lspinfo", "spectre_panel", "startuptime", "tsplayground" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

autocmd("LspAttach", {
  group = general,
  desc = "Disable inlay hints on leave",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.keymap.set("n", "<leader>uh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle inlay hints" })
    end
  end,
})

-- Start treesitter highlighting for all filetypes with a parser
local treesitter = augroup("treesitter", { clear = true })
autocmd("FileType", {
  group = treesitter,
  desc = "Start treesitter highlighting",
  callback = function(event)
    local bufnr = event.buf
    local ok, _ = pcall(vim.treesitter.start, bufnr)
    if not ok then
      vim.notify("Failed to start treesitter for " .. vim.bo[bufnr].filetype, vim.log.levels.DEBUG)
    end
  end,
})
