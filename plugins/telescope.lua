local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  local fb_actions = telescope.extensions.file_browser.actions

  return {
    defaults = {
      prompt_prefix = " ",
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
      mappings = {
        i = {
          ["<C-z>"] = "which_key",
        },
      },
      file_ignore_patterns = {
        ".git",
        ".cache",
      },
    },
    extensions = {
      file_browser = {
        mappings = {
          i = {
            ["<C-/>"] = fb_actions.toggle_hidden,
          },
          n = {
            z = fb_actions.toggle_hidden,
          },
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = function(opts)
          return { "--hidden" }
        end,
      },
    },
  }
end
