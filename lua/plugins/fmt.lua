return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format { async = true, lsp_fallback = true }
            end,
            mode = "",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function()
            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end,
        formatters_by_ft = {
            -- lua = { "stylua" },
            python = { "isort", "black" },
        },
    },
}
