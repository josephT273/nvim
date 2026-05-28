return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      dim_inactive = { enabled = false },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        indent_blankline = { enabled = true },
        native_lsp = { enabled = true },
        mason = true,
        lsp_trouble = true,
        noice = true,
        dap = true,
        dap_ui = true,
        harpoon = true,
        flash = true,
        mini = { enabled = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
