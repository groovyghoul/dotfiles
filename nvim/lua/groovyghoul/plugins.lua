require("lazy").setup({
    -- misc plugins
    "nvim-tree/nvim-web-devicons",
    "akinsho/toggleterm.nvim",
    -- telescope plugins
    { "nvim-telescope/telescope.nvim",
        dependencies = {
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
    "folke/trouble.nvim",
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
    "lewis6991/gitsigns.nvim",
})