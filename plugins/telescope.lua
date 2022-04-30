local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  local actions = require "telescope.actions"
  local fb_actions = require("telescope").extensions.file_browser.actions
  local hop = telescope.extensions.hop

  return {
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
        },
      },
      mappings = {
        i = {
          ["<C-h>"] = hop.hop,
          ["<C-space>"] = function(prompt_bufnr)
            local opts = {
              callback = actions.toggle_selection,
              loop_callback = actions.send_selected_to_qflist,
            }
            hop._hop_loop(prompt_bufnr, opts)
          end,
        },
      },
    },
    extensions = {
      file_browser = {
        mappings = {
          i = {
            ["<C-z>"] = fb_actions.toggle_hidden,
          },
          n = {
            z = fb_actions.toggle_hidden,
          },
        },
      },
    },
  }
end
