return function()
  require("nightfox").setup {
    options = {
      transparent = true, -- Disable setting background
      styles = { -- Style to be applied to different syntax groups
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "italic",
        constants = "italic",
        functions = "italic,bold",
        keywords = "bold",
      },
      inverse = { -- Inverse highlight for different types
        match_paren = true,
        search = true,
      },
      modules = {
        barbar = false,
        fern = false,
        fidget = false,
        gitgutter = false,
        glyph_palette = false,
        illuminate = false,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        mini = false,
        modes = false,
        neogit = false,
        nvimtree = false,
        pounce = false,
        sneak = false,
        symbol_outline = false,
      },
    },
    groups = {
      all = {
        NormalFloat = { bg = "#000000" },
        WhichKeyFloat = { bg = "#000000" },
      },
    },
  }
end
