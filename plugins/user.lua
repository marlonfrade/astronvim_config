-- TODO:Testando

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    event = "User Astrofile",
    cmd = { "TodoQuickFix", "TodoTelescope" },
    keys = { "<leader>T", "<cmd>TodoTelescope<cr>", description = "Open TODOs in Telescope" },
  },
}
