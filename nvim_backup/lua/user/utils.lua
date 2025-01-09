local M = {}

--@param filesystem_type: `file` or `directory`
function M.findup(filenames, filesystem_type, path)
    if type(filenames) == "string" then
        filenames = { filenames }
    end
    return vim.fs.find(filenames, {
        upward = true,
        type = filesystem_type or "file",
        path = path or vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
    })[1]
end

local function run_command(command, opts)
    local parts = vim.split(command, " ")
    local args = {}
    local cmd = parts[1]
    if not opts then
        opts = {}
    end

    for i, part in ipairs(parts) do
        if i > 1 then
            table.insert(args, part)
        end
    end

    local results = {}

    if opts.notify then
        vim.notify("Running " .. command, vim.log.levels.DEBUG)
    end

    require("plenary.job")
        :new({
            command = cmd,
            args = args,
            on_exit = function(job, return_code)
                results.return_code = return_code
                results.stdout_lines = job:result()
                results.stderr_lines = job:stderr_result()
            end,
        })
        :sync(opts.wait_timeout)
    results.stdout = vim.fn.join(results.stdout_lines, "")
    results.stderr = vim.fn.join(results.stderr_lines, "")

    if results.return_code ~= 0 then
        vim.notify(
            command .. ", stderr:\n" .. results.stderr,
            vim.log.levels.ERROR,
            { title = cmd .. " returned " .. results.return_code }
        )
    end

    return results
end

M.run_command = run_command

function M.exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

function M.shasum(file)
    return vim.split(run_command("shasum " .. file).stdout, " ")[1]
end

function M.read_file(path)
    local file = io.open(path, "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

function M.write_file(path, content)
    local file = io.open(path, "w")
    if not file then
        print("Bad file path: " .. path)
        return nil
    end
    file:write(content)
    file:flush()
    file:close()
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf ---@type number
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

function M.is_running_location(location)
    if
        location == "laptop"
        and string.find(M.run_command("uname").stdout, "Darwin")
    then
        return true
    end
    local hostname = M.run_command("hostname").stdout
    if string.find(hostname, location) then
        return true
    end
    return false
end

return M
