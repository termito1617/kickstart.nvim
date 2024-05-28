local gosuffix = '.go'
local gotestsuffix = '_test.go'
local open_test = function()
  local path = vim.fn.expand '%:p'

  if path:sub(-#gosuffix) ~= gosuffix then
    print 'Not a .go file'
    return
  end

  if path:sub(-#gotestsuffix) == gotestsuffix then
    print 'Already in test file'
    return
  end

  vim.cmd('edit ' .. path:sub(0, -#gosuffix - 1) .. gotestsuffix)
end

vim.keymap.set('n', '<leader>gt', open_test, { desc = '[G]o to [T]est file' })
