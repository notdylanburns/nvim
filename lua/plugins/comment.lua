return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {
            ignore = "^$",
        },
        config = function(_, opts)
            require("Comment").setup(opts)
        end
    }
}
