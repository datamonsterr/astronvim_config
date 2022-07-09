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
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<C-k>"] = actions.toggle_selection + actions.move_selection_better,
      },

      n = {
        ["<C-h>"] = actions.select_horizontal,
      },
    },
  },
}
