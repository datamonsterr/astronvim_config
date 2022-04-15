return function()
	local dap, dapui = require("dap"), require("dapui")
	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸" },
		mappings = {
			expand = "<cr>",
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		sidebar = {
			elements = {
				{ id = "scopes", size = 0.5 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
			},
			size = 40,
			position = "right",
		},
		tray = {
			elements = { "repl" },
			size = 10,
			position = "bottom",
		},
		floating = {
			border = "rounded",
			mappings = {
				close = { "q", "<esc>" },
			},
		},
		windows = { indent = 1 },
	})
	-- add listeners to auto open DAP UI
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end
