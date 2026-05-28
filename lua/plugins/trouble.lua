return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Toggle trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Location list" },
      { "gR", "<cmd>TroubleToggle lsp_references<CR>", desc = "LSP references" },
    },
    opts = {
      focus = true,
      use_diagnostic_signs = true,
      auto_close = true,
      icons = true,
      modes = {
        lsp_references = {
          params = { include_declaration = false },
        },
      },
    },
  },
}
