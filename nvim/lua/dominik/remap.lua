vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- GET RID OF PAGEUP AND PAGEDOWN KEYS FROM THIS STUPID LAPTOP KEYBOARD LAYOUT
vim.keymap.set({ "n", "v", "s", "x" }, "<PageUp>", "<nop>")
vim.keymap.set({ "n", "v", "s", "x" }, "<PageDown>", "<nop>")

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Bring line under to this line
vim.keymap.set("n", "J", "mzJ`z")

-- No idea
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- Replace line with clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- NO IDEA? Just acts like yy ?
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Q -> do nothing
vim.keymap.set("n", "Q", "<nop>")

-- Not sure? Creates new tmux session?
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Find + Replace all
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- MAKE IT MFN RAIN
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
