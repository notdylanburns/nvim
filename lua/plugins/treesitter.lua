return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = {
            ensure_installed = {
                "c",
                "comment",
                "cpp",
                "css",
                "glimmer",
                "go",
                "html",
                "java",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "markdown",
                "lua",
                "python",
                "query",
                "rst",
                "rust",
                "yaml",
                "svelte",
                "tsx",
                "typescript"
            },

            autotag = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            matchup = { enable = true },
            playground = { enable = true },

            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>",
                    node_incremental = "<Enter>",
                    node_decremental = "<BS>",
                },
            },
        }
    }
}
