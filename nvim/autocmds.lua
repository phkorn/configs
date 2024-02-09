vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = 'Misc',
  pattern = '*',
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})


