local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        sqls = {
          cmd = { "sqls", "-config", vim.fn.getcwd() .. "/.sqls.yml" },
          root_dir = util.root_pattern(".git", ".sqls.yml"),
          on_attach = function(client, bufnr)
            -- disable sqls formatting (to avoid mangled SQL)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
}
