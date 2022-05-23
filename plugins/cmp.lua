local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local cmp = require "cmp"

return {
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    documentation = {
      -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      border = { " ", " ", " ", " ", " ", " ", " ", " " },
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[API]",
        latex_symbols = "[LaTeX]",
        cmp_tabnine = "[Tabnine]",
        path = "[Path]",
        emoji = "[Emoji]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp_signature_help" },
  },
  mapping = {
    ["<C-j>"] = cmp.config.disable,
    ["<C-k>"] = cmp.config.disable,
  },
}
