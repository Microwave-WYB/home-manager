return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Add navic to winbar
      opts.winbar = {
        lualine_c = {
          {
            "navic",
            color_correction = nil,
            navic_opts = nil,
          },
        },
      }
      return opts
    end,
  },
}
