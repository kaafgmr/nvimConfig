local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>c", function() harpoon:list():clear() end)
vim.keymap.set("n", "<C-u>", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-d>", function() harpoon:list():next() end)
vim.keymap.set("n", "<C-a>", function() harpoon:list():prev() end)
