local kind_icons = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = "",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

return {
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    documentation = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "Buf",
        nvim_lsp = "LSP",
        luasnip = "LuaSnip",
        nvim_lua = "Lua",
        latex_symbols = "LaTeX",
        cmp_tabnine = "Tabnine",
        path = "Path",
      })[entry.source.name]
      return vim_item
    end,
  },
  enabled = function()
    -- disable completion in comments
    local context = require "cmp.config.context"
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
    end
  end,
}
