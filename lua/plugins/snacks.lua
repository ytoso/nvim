return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        terminal = {
            enabled = true,
            win = {
                position = "right",
            },
        },
    },
    keys = {
        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    }
}
