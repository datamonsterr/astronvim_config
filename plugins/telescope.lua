return {
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
      },
    },
    mappings = {
      i = {
        ["<C-h>"] = require("telescope.actions").select_horizontal,
      },
    },
  },
}
