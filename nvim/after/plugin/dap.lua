require("dapui").setup()

local dap = require("dap")
dap.set_log_level("DEBUG")

local function file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function get_python()
    local python_path = os.getenv("HOME") .. "/bin/python"

	local brazil_python = file_exists("../../Aws-ps-heap-main-1.0/runtime/bin/python")
	if brazil_python ~= true then
		python_path = "../../Aws-ps-heap-main-1.0/runtime/bin/python"
	end

	local virtualenv = vim.fn.getenv("VIRTUAL_ENV")
	if virtualenv ~= vim.NIL or virtualenv ~= "" then
		python_path = os.getenv("HOME") .. "/.asdf/shims/python"
	else
		python_path = virtualenv .. "/bin/python"
	end

	return python_path
end

dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.adapters.python = {
	type = "executable",
	command = get_python(),
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = get_python(),
	},
}

local function get_node()
	local node_path = string.format("%s/.asdf/shims/node", os.getenv("HOME"))
	return node_path
end

dap.adapters["pwa-node"] = function(on_config, config, parent)
	local target = config["__pendingTargetId"]
	if target and parent then
		local adapter = parent.adapter --[[@as ServerAdapter]]
		on_config({
			type = "server",
			host = "localhost",
			port = adapter.port,
		})
	else
		on_config({
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = get_node(),
				-- 💀 Make sure to update this path to point to your installation
				args = { string.format("%s/bin/js-debug/src/dapDebugServer.js", os.getenv("HOME")), "${port}" },
			},
		})
	end
end

dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
