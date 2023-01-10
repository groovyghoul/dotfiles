local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

-- system yank/paste instead of using unnamedplus option
-- Copy to clipboard
local opts = { noremap = true, silent = true }
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>Y", '"+yg_', opts)
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>yy", '"+yy', opts)

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', opts)
vim.keymap.set("n", "<leader>P", '"+P', opts)
vim.keymap.set("v", "<leader>p", '"+p', opts)
vim.keymap.set("v", "<leader>P", '"+P', opts)

-- better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })

-- Switch buffers with <shift> hl
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "other-window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "delete-window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "split-window-below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "split-window-right" })

return M
