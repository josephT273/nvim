return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local install = require("nvim-treesitter.install")
      local parsers = {
        "c", "cpp", "rust", "go", "python", "java",
        "javascript", "typescript", "tsx", "html", "css",
        "json", "yaml", "toml", "lua", "bash", "dockerfile",
        "gitignore", "make", "markdown", "regex", "sql",
        "graphql", "prisma", "cmake", "svelte",
      }
      local task = install.install(parsers, {})
      local ok, err = pcall(task.wait, task)
      if not ok then
        vim.notify("Failed to install treesitter parsers: " .. tostring(err))
      end
    end,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.config").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
