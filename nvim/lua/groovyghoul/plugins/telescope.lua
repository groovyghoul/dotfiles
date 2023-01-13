return {
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
}
