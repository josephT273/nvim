return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    opts = {
      preset = "powerlike",
      multiple_diag_style = "each",
      options = {
        enable_on_insert = true,
        enable_on_exit = true,
        show_source = true,
        prefix = "",
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
    end,
  },
}
