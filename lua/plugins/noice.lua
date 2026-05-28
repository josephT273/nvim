return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = 60, height = "auto" },
        },
        popupmenu = { relative = "editor", position = { row = 8, col = "50%" }, size = { width = 60, height = 10 } },
      },
      cmdline = { enabled = true },
      messages = { enabled = true },
      notify = { enabled = true },
      lsp = {
        progress = { enabled = true },
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines",
          "vim.lsp.util.stylize_markdown",
        },
        signature = { enabled = false },
        hover = { enabled = false },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
}
