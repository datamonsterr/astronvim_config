local actions = require "telescope.actions"
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
        ["<C-h>"] = actions.select_horizontal,
      },

      n = {
        ["<C-h>"] = actions.select_horizontal,
      },
    },
  },
}
