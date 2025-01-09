local U = require("user.utils")

local function pyright_config()
    local pyright_json = U.findup("pyrightconfig.json")
    if pyright_json then
        vim.notify(
            "pyrightconfig.json found at " .. pyright_json,
            vim.log.levels.DEBUG
        )
        return vim.json.decode(U.read_file(pyright_json))
    end
    return nil
end

local function find_python()
    local pyright_data = pyright_config()
    if pyright_data then
        local python_location = pyright_data["venvPath"]
            .. "/"
            .. pyright_data["venv"]
            .. "/bin/python"
        if not U.exists(python_location) then
            vim.notify_once(
                python_location .. " doesn't exist, try running bemol",
                vim.log.levels.DEBUG
            )
        end
        vim.notify_once(
            "Using pyright python: " .. python_location,
            vim.log.levels.DEBUG
        )
        return python_location
    end

    local virtual_env = os.getenv("VIRTUAL_ENV")
    if virtual_env then
        vim.notify_once(
            "Using VIRTUAL_ENV python: " .. virtual_env .. "/bin/python",
            vim.log.levels.DEBUG
        )
        return virtual_env .. "/bin/python"
    end

    local env_dir = U.findup({ ".venv", ".env", "venv" }, "directory")
    if env_dir and U.exists(env_dir .. "/bin/python") then
        vim.notify_once(
            "Using discovered venv: " .. env_dir .. "/bin/python",
            vim.log.levels.DEBUG
        )
        return env_dir .. "/bin/python"
    end

    local system_python = U.run_command("which python")
    if system_python.return_code == 0 then
        vim.notify_once(
            "Using system python: " .. system_python.stdout,
            vim.log.levels.DEBUG
        )
        return system_python.stdout
    end
    vim.notify_once("No python found", vim.log.levels.ERROR)
end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "mfussenegger/nvim-dap-python",
            "mxsdev/nvim-dap-vscode-js",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()

            --- Python
            require("dap-python").setup()
            -- dap.setup(
            --     vim.fn.stdpath("data")
            --         .. "/mason/packages/debugpy/venv/bin/python"
            -- )
            dap.test_runner = "pytest"
            dap.resolve_python = find_python

            dap.listeners.before.event_initialized["disable-pytest-cov"] = function()
                -- coverage.py causes breakpoints to not work
                -- https://pytest-cov.readthedocs.io/en/latest/debuggers.html
                if U.exists("setup.cfg") then
                    U.run_command(
                        "sed -ie s/^\\(\\s\\+--cov\\)/#NEOVIM\\1/ setup.cfg",
                        { notify = true }
                    )
                end
            end
            dap.listeners.before.event_exited["disable-pytest-cov"] = function()
                -- undo
                if U.exists("setup.cfg") then
                    U.run_command(
                        "sed -ie s/^#NEOVIM// setup.cfg",
                        { notify = true }
                    )
                end
            end

            --- JS/TS
            -- TODO

            --- Go
            require("dap-go").setup()

            require("nvim-dap-virtual-text").setup()

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
