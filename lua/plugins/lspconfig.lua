return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
          "ray-x/lsp_signature.nvim",
          event = "VeryLazy",
          opts = {},
          config = true,
    }
}
