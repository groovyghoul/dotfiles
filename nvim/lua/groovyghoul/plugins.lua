require("lazy").setup({
    -- misc plugins
    "nvim-tree/nvim-web-devicons",
    "akinsho/toggleterm.nvim",
    -- telescope plugins
    { "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-lua/plenary.nvim",
        },
        cmd = {
            "Telescope",
        },
    },
    "nvim-telescope/telescope-file-browser.nvim",
    -- treesitter plugins
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- for commenting code easily
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- lsp plugins
    "neovim/nvim-lspconfig",
    "nvim-lua/lsp-status.nvim",
    "williamboman/mason.nvim",
    "j-hui/fidget.nvim",
    -- debug tools
    { "puremourning/vimspector", cmd = { "VimspectorInstall", "VimspectorUpdate" } },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        },
    },
    -- completion plugins
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            -- ...
        end,
    },
    -- colorschemes
    "folke/tokyonight.nvim",
    -- status line
    "rebelot/heirline.nvim",
    -- git stuff
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "契" },
                topdelete = { text = "契" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        },
    },
    -- bufferline
    {
        "akinsho/nvim-bufferline.lua",
        event = "BufAdd",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diag)
                    local icons = require("groovyghoul.settings").icons.diagnostics
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },
})
