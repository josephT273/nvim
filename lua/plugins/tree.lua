return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree sidebar" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_cursor = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      reload_on_bufenter = true,
      select_prompts = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = { arrow_closed = "▸", arrow_open = "▾" },
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = { enable = false },
        },
      },
      filters = {
        dotfiles = false,
        custom = { "node_modules", ".git" },
      },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
}
