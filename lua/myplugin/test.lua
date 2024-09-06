local M = {}

M.path_separator = "/"
M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
if M.is_windows then
    M.path_separator = "\\"
end

function M.split(input, sep)
  local fields = {}

  local pattern = string.format("([^%s]+)", sep)

  local _ = string.gsub(input, pattern, function(c) fields[#fields + 1] = c end)

  return fields
end

function M.path_join(...)
    local args = {...}
    if #args == 0 then
        return ""
    end

    local all_parts = {}
    if type(args[1]) == "string" and args[1]:sub(1, 1) == M.path_separator then
        all_parts[1] = ""
    end

    for _, arg in ipairs(args) do
        local arg_parts = M.split(arg, M.path_separator)
        vim.list_extend(all_parts, arg_parts)
    end
    return table.concat(all_parts, M.path_separator)
end

function M.get_project_root()
    local original_dir = vim.api.nvim_buf_get_name(0)
    local dirname = original_dir
    while true do
        dirname = vim.fn.fnamemodify(dirname, ":h:p")

        local dot_project_path = M.path_join(dirname, ".project")
        if vim.uv.fs_stat(dot_project_path) and vim.fn.isdirectory(dot_project_path) then
            return dirname, dot_project_path
        end

        if vim.fn.fnamemodify(dirname, ":h:p") == dirname then
            error("not a project root (or any parent directory): " .. original_dir)
        end
    end
end

function M.run_cmd(cmd)
    local project_root, dot_project = M.get_project_root()
    local cmd_dir = M.path_join(dot_project, "cmd")
    local cmd_path = M.path_join(cmd_dir, cmd)

    if not vim.fn.isdirectory(cmd_dir) or not vim.uv.fs_stat(cmd_path) then
        error("no such command: " .. cmd)
    end

    vim.cmd.new()
    vim.fn.termopen(
        cmd_path,
        {
            cwd = project_root,
        }
    )
end

function M.activate_env(env)
    local _, dot_project = M.get_project_root()
    local env_dir = M.path_join(dot_project, "env")
    local env_path = M.path_join(env_dir, env)

    if not vim.fn.isdirectory(env_dir) or not vim.uv.fs_stat(env_path) then
        error("no such environment: " .. env)
    end

    local f = io.open(env_path, "r")
    if f == nil then
        error("failed to read env file: " .. env_path)
    end

    local env_vars = vim.json.decode(f:read("*a"))
    if env_vars == nil then
        error("failed to parse env json: " .. env_path)
    end

    for k, v in pairs(env_vars) do
        vim.env[k] = v
        -- vim.cmd("let $" .. k .. " = " .. "'" .. v .. "'")
    end
end

return M
