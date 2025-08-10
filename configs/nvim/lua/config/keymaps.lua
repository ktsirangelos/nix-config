-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Helper function for getting file paths
local function get_file_path(mode)
  local path_map = {
    absolute = vim.fn.expand("%:p"),
    relative = vim.fn.expand("%"),
    filename = vim.fn.expand("%:t"),
  }
  return path_map[mode] or path_map.absolute
end

-- File path operations
keymap("n", "<Leader>Ca", function()
  local path = get_file_path("absolute")
  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path, vim.log.levels.INFO)
end, vim.tbl_extend("force", opts, { desc = "[C]opy [a]bsolute path" }))

keymap("n", "<Leader>Cr", function()
  local path = get_file_path("relative")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path, vim.log.levels.INFO)
end, vim.tbl_extend("force", opts, { desc = "[C]opy [r]elative path" }))

keymap("n", "<Leader>Cf", function()
  local path = get_file_path("filename")
  vim.fn.setreg("+", path)
  vim.notify("Copied filename: " .. path, vim.log.levels.INFO)
end, vim.tbl_extend("force", opts, { desc = "[C]opy [f]ilename" }))

-- Selection
keymap("n", "<leader>sA", "ggVG", vim.tbl_extend("force", opts, { desc = "[s]elect [A]ll" }))

-- Replace functionality
local function setup_replace(text)
  local escaped_text = text:gsub("[%[%]%(%)%.%+%-%*%?%^%$%%]", "\\%1")
  local cmd = string.format("%%s/%s//g", escaped_text)
  vim.api.nvim_input(":" .. cmd .. "<Left><Left>")
end

local function save_and_get_register(register)
  local saved = vim.fn.getreg(register)
  return function()
    vim.fn.setreg(register, saved)
  end
end

-- Replace word under cursor
keymap("n", "<leader>rw", function()
  local restore = save_and_get_register('"')
  vim.cmd("normal! yiw")
  local word = vim.fn.getreg('"')
  restore()
  setup_replace(word)
end, vim.tbl_extend("force", opts, { desc = "[r]eplace [w]ord" }))

-- Replace selection
keymap("v", "<leader>rs", function()
  local restore = save_and_get_register('"')
  vim.cmd('normal! "vy"')
  local selected_text = vim.fn.getreg("v")
  restore()
  setup_replace(selected_text)
end, vim.tbl_extend("force", opts, { desc = "[r]eplace [s]election" }))
