return function()
  local dap = require "dap"
  dap.adapters = {
    python = {
      type = "executable",
      command = "/usr/bin/python",
      args = { "-m", "debugpy.adapter" },
    },
    cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/dat/extension/debugAdapters/bin/OpenDebugAD7",
    },
    go = function(callback, config)
      local stdout = vim.loop.new_pipe(false)
      local handle
      local pid_or_err
      local port = 38697
      local opts = {
        stdio = { nil, stdout },
        args = { "dap", "-l", "127.0.0.1:" .. port },
        detached = true,
      }
      handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
          print("dlv exited with code", code)
        end
      end)
      assert(handle, "Error running dlv: " .. tostring(pid_or_err))
      stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(function()
            require("dap.repl").append(chunk)
          end)
        end
      end)
      -- Wait for delve to start
      vim.defer_fn(function()
        callback { type = "server", host = "127.0.0.1", port = port }
      end, 100)
    end,
  }
  dap.configurations = {
    python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
      },
    },
    cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
      },
    },
    go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "go",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    },
  }
  dap.configurations.rust = dap.configurations.cpp
  local function start_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
  end
  local function terminate_session(_, _)
    local info_string = string.format("%s", dap.session().config.program)
    vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
  end
  dap.listeners.after.event_initialized["dapui"] = start_session
  dap.listeners.before.event_terminated["dapui"] = terminate_session
  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end
