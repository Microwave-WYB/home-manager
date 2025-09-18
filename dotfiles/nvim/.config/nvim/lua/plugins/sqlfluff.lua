return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        sqlfluff = {
          cmd = "sqlfluff",
          stdin = false,
          args = { "lint", "--format=json" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          command = "sqlfluff",
          args = { "fix", "--force", "-" },
          stdin = true,
        },
      },
    },
  },
}
