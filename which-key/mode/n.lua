local pre = function(pre)
  return require("user.which-key.prefix." .. pre)
end

return {
  ["<leader>"] = pre "leader",
  g = pre "g",
  z = pre "z",
}
