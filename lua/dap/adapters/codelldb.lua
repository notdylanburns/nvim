return function(config)
    config.adapters = {
        type = "server",
        port = "13000",
        executable = {
            command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
            args = { "--port", "13000" },
        }
    }
    require('mason-nvim-dap').default_setup(config)
end
