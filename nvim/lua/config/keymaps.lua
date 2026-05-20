-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Minimal Claude Code: floating terminal toggle, nothing else
vim.keymap.set({ "n", "t" }, "<leader>ac", function()
  Snacks.terminal.toggle("claude", { win = { position = "float", border = "rounded" } })
end, { desc = "Toggle Claude" })
