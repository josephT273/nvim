return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon: Add file" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: Quick menu" },
      { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: File 1" },
      { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: File 2" },
      { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: File 3" },
      { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: File 4" },
      { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon: File 5" },
    },
    opts = {},
  },
}
