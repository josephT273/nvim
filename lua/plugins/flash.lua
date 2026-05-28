return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash: Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash: Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Flash: Remote" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash: TS Search" },
      { "<C-s>", mode = { "i", "x", "n" }, function() require("flash").toggle() end, desc = "Flash: Toggle" },
    },
    opts = {
      modes = {
        search = { enabled = false },
        char = {
          jump_labels = true,
          multi_label = true,
        },
      },
      label = { uppercase = false },
    },
  },
}
