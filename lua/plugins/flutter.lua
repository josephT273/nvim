return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/conform.nvim",
    },
    config = function()
      local flutter_ok, flutter = pcall(require, "flutter-tools")
      if not flutter_ok then
        return
      end

      flutter.setup({
        decorations = {
          statusline = true,
        },
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "gd", vim.lsp.buf.definition, "LSP: Definition")
            map("n", "gD", vim.lsp.buf.declaration, "LSP: Declaration")
            map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementation")
            map("n", "gr", vim.lsp.buf.references, "LSP: References")
            map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
            map("n", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature help")
            map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
            map("n", "<leader>f", function()
              vim.lsp.buf.format({ async = true })
            end, "LSP: Format")
            map("n", "[d", vim.diagnostic.goto_prev, "Diagnostic: Previous")
            map("n", "]d", vim.diagnostic.goto_next, "Diagnostic: Next")
            map("n", "<leader>vd", vim.diagnostic.open_float, "Diagnostic: Line")

            if client and client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                group = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = true }),
                callback = vim.lsp.buf.document_highlight,
              })
              vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = bufnr,
                group = vim.api.nvim_create_augroup("lsp-document-highlight-clear", { clear = true }),
                callback = vim.lsp.buf.clear_references,
              })
            end
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
      })
    end,
  },
}
