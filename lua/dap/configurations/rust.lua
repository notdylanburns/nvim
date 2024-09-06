return {
    {
        name = "Launch (Rust)",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        targetCreateCommands = {
            "settings set target.process.thread.step-avoid-libraries std"
        }
    },
}
