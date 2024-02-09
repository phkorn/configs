vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

vim.api.nvim_create_autocmd({ "DirChanged" }, {
  callback = function()
  local global_cwd = vim.fn.getcwd(-1, -1)
  require("nvim-tree.api").tree.change_root(global_cwd)
  end
})
