return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>hs", require("gitsigns").stage_hunk, "Git: Stage hunk")
        map("n", "<leader>hr", require("gitsigns").reset_hunk, "Git: Reset hunk")
        map("v", "<leader>hs", function()
          require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Git: Stage hunk")
        map("v", "<leader>hr", function()
          require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Git: Reset hunk")
        map("n", "<leader>hp", require("gitsigns").preview_hunk, "Git: Preview hunk")
        map("n", "<leader>hb", require("gitsigns").blame_line, "Git: Blame")
        map("n", "<leader>hd", require("gitsigns").diffthis, "Git: Diff")
        map("n", "]h", function()
          if vim.wo.diff then return "]h" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end, "Git: Next hunk")
        map("n", "[h", function()
          if vim.wo.diff then return "[h" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
        end, "Git: Prev hunk")
      end,
    },
  },
}
