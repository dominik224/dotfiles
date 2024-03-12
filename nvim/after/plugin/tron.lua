local tron = require('tron')

vim.keymap.set("n", "<leader>tr",function() vim.cmd(":w") tron.run_test() end)
vim.keymap.set("n", "<leader>ts", function() tron.show_output() end)
vim.keymap.set("n", "<leader>tc", function() tron.clear_signs() end)
