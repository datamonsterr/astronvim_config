local mappings = {
  ["<leader>"] = {
    name = "Plugins",
    x = { name = "Debugger" },
    d = { name = "Document" },
    h = { name = "Hop" },
  },
  ["]"] = {
    name = "Next objects",
    f = "Next function",
    c = "Next class",
    F = "Next end function",
    C = "Next end class",
    ["/"] = "Next comment",
  },
  ["["] = {
    name = "Prev objects",
    f = "Prev function",
    c = "Prev class",
    F = "Prev end function",
    C = "Prev end class",
    ["/"] = "Prev comment",
  },
}

return mappings
