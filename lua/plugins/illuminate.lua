return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      filetypes_denylist = { "alpha", "NvimTree", "TelescopePrompt" },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
