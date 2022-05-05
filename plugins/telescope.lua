local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  local actions = require "telescope.actions"
  local fb_actions = require("telescope").extensions.file_browser.actions
  local hop = telescope.extensions.hop

  return {
    defaults = {
      defaults = {
        prompt_prefix = "  ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
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
