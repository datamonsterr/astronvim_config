return {
  ensure_installed = { "cpp", "vim", "lua", "python", "rust", "javascript", "html", "css", "json", "toml" },
  matchup = {
    enable = true,
  },
  highlight = {
    disable = { "css" },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ax"] = "@class.outer",
        ["ix"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]x"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]X"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[x"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[X"] = "@class.outer",
      },
    },
    swap = {
      enable = false,
    },
  },
}
