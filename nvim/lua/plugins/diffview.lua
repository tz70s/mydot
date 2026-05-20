return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gv", "", desc = "+diffview" },
      { "<leader>gvd", "<cmd>DiffviewOpen<cr>", desc = "Diff vs index" },
      { "<leader>gvm", "<cmd>DiffviewOpen main...HEAD<cr>", desc = "Diff vs main" },
      { "<leader>gvh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gvb", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
      { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
    },
  },
}
