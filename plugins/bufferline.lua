return function()
	if vim.g.colors_name == "default_theme" then
		return {
			options = {
				offsets = {
					{ filetype = "neo-tree", text = "File Explorer", highlight = "NeoTreeNormalNC", padding = 1 },
				},
			},
			highlights = {
				background = {
					guifg = { attribute = "fg", highlight = "BufferLineBackground" },
					guibg = { attribute = "bg", highlight = "BufferLineBackground" },
				},

				-- Buffers
				buffer_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineBufferSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineBufferSelected" },
					gui = "bold",
				},
				buffer_visible = {
					guifg = { attribute = "fg", highlight = "BufferLineBufferVisible" },
					guibg = { attribute = "bg", highlight = "BufferLineBufferVisible" },
				},

				-- Diagnostics
				error = {
					guifg = { attribute = "fg", highlight = "BufferLineError" },
					guibg = { attribute = "bg", highlight = "BufferLineError" },
				},
				error_diagnostic = {
					guifg = { attribute = "fg", highlight = "BufferLineErrorDiagnostic" },
					guibg = { attribute = "bg", highlight = "BufferLineErrorDiagnostic" },
				},

				-- Close buttons
				close_button = {
					guifg = { attribute = "fg", highlight = "BufferLineCloseButton" },
					guibg = { attribute = "bg", highlight = "BufferLineCloseButton" },
				},
				close_button_visible = {
					guifg = { attribute = "fg", highlight = "BufferLineCloseButtonVisible" },
					guibg = { attribute = "bg", highlight = "BufferLineCloseButtonVisible" },
				},
				close_button_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineCloseButtonSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineCloseButtonSelected" },
				},
				fill = {
					guifg = { attribute = "fg", highlight = "BufferLineFill" },
					guibg = { attribute = "bg", highlight = "BufferLineFill" },
				},
				indicator_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineIndicatorSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineIndicatorSelected" },
				},

				-- Modified
				modified = {
					guifg = { attribute = "fg", highlight = "BufferLineModified" },
					guibg = { attribute = "bg", highlight = "BufferLineModified" },
				},
				modified_visible = {
					guifg = { attribute = "fg", highlight = "BufferLineModifiedVisible" },
					guibg = { attribute = "bg", highlight = "BufferLineModifiedVisible" },
				},
				modified_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineModifiedSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineModifiedSelected" },
				},

				-- Separators
				separator = {
					guifg = { attribute = "fg", highlight = "BufferLineSeparator" },
					guibg = { attribute = "bg", highlight = "BufferLineSeparator" },
				},
				separator_visible = {
					guifg = { attribute = "fg", highlight = "BufferLineSeparatorVisible" },
					guibg = { attribute = "bg", highlight = "BufferLineSeparatorVisible" },
				},
				separator_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineSeparatorSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineSeparatorSelected" },
				},

				-- Tabs
				tab = {
					guifg = { attribute = "fg", highlight = "BufferLineTab" },
					guibg = { attribute = "bg", highlight = "BufferLineTab" },
				},
				tab_selected = {
					guifg = { attribute = "fg", highlight = "BufferLineTabSelected" },
					guibg = { attribute = "bg", highlight = "BufferLineTabSelected" },
				},
				tab_close = {
					guifg = { attribute = "fg", highlight = "BufferLineTabClose" },
					guibg = { attribute = "bg", highlight = "BufferLineTabClose" },
				},
			},
		}
	else
		return {
			options = {
				offsets = {
					{ filetype = "neo-tree", text = "File Explorer", highlight = "NeoTreeNormalNC", padding = 1 },
				},
			},
		}
	end
end
