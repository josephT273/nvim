return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "clangd",
        "rust-analyzer",
        "gopls",
        "pyright",
        "ruff-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "json-lsp",
        "yamlls",
        "lua-language-server",
        "bash-language-server",
        "sql-language-server",
        "java-language-server",
        "svelte-language-server",
        "prettier",
        "stylua",
        "shfmt",
        "black",
        "isort",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
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
      end

      local servers = {
        clangd = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              imports = { granularity = { group = "module" }, prefix = "self" },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
            },
          },
        },
        pyright = {},
        ruff = {},
        ts_ls = {},
        tailwindcss = {},
        jsonls = {},
        yamlls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        bashls = {},
        sqlls = {},
        jdtls = {},
        svelte = {},
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            server.on_attach = on_attach
            lspconfig[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
