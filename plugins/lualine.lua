return function()
	local status = require("core.status")
	local colors = require("default_theme.colors")
	local detect_theme = function(theme_name)
		local theme
		if theme_name == "" or vim.g.colors_name == "default_theme" then
			theme = "onedark"
		else
			theme = theme_name
		end
		return theme
	end
	local color_with_theme = function(color)
		if vim.g.colors_name == "default_theme" then
			return color
		else
			return ""
		end
	end
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	local spacer = {
		function()
			return " "
		end,
		padding = { left = 0, right = 0 },
	}

	local config = {
		options = {
			disabled_filetypes = { "dashboard" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
			theme = detect_theme("onedark"),
		},
		sections = {
			lualine_a = {
				spacer,
			},
			lualine_b = {
				{
					"branch",
					icon = "",
					color = {
						fg = color_with_theme(colors.purple_1),
						gui = "bold",
					},
					padding = { left = 2, right = 2 },
				},
			},
			lualine_c = {
				{
					"filetype",
					cond = conditions.buffer_not_empty,
					color = { fg = color_with_theme(colors.purple), gui = "bold" },
					padding = { left = 2, right = 2 },
				},
				{
					"filename",
					cond = conditions.buffer_not_empty,
					color = { fg = color_with_theme(colors.red), gui = "bold" },
					padding = { left = 2, right = 2 },
				},
				{
					"diff",
					symbols = { added = " ", modified = "柳", removed = " " },
					cond = conditions.hide_in_width,
					padding = { left = 2, right = 2 },
				},
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
					separator = " ",
					padding = { left = 2, right = 2 },
				},
				spacer,
			},
			lualine_x = {
				spacer,
				{
					status.lsp_name,
					icon = " ",
					color = { fg = color_with_theme(colors.yellow), gui = "bold" },
					padding = { left = 2, right = 2 },
					cond = conditions.hide_in_width,
				},
				{
					status.treesitter_status,
					color = { fg = color_with_theme(colors.green), gui = "bold" },
					padding = { left = 1, right = 2 },
					cond = conditions.hide_in_width,
				},
			},
			lualine_y = {
				{
					"progress",
					color = { fg = color_with_theme(colors.blue), gui = "bold" },
					padding = { left = 1, right = 2 },
				},
			},
			lualine_z = { spacer },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}
	return config
end
