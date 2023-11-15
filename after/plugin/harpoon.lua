local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>d", mark.rm_file)
vim.keymap.set("n", "<leader>c", mark.clear_all)
vim.keymap.set("n", "<C-u>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-d>", function() ui.nav_next() end)
vim.keymap.set("n", "<C-a>", function() ui.nav_prev() end)
