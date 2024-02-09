-- needs to be set before loading lazy:wq
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require('lualine').setup()

vim.opt.termguicolors = true
require("bufferline").setup({})


local nnn = require("nnn").builtin
require("nnn").setup({
  quitcd = "cd",
  mappings = {
  }
})

require("nvim-tree").setup()