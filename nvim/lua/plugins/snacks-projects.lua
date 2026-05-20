return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          Snacks.picker.projects({
            dev = { "~/Workspace" },
            patterns = { ".git" },
          })
        end,
        desc = "Projects",
      },
    },
  },
}
