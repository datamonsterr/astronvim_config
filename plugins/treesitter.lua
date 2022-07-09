return {
  -- this is a comment
  ensure_installed = { "cpp", "vim", "lua", "python", "rust", "javascript", "html", "css", "json", "toml" },
  matchup = {
    enable = true,
  },
  highlight = {
    disable = { "css" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "python" } },
  incremental_selection = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["of"] = "@function.outer",
        ["if"] = "@function.inner",
        ["oc"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]/"] = "@comment.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[/"] = "@comment.outer",
      },
    },
    swap = {
      enable = false,
    },
  },
}
