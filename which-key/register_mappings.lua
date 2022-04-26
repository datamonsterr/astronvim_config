local mode = function(mode)
  return require("user.which-key.mode." .. mode)
end

return {
  n = mode "n",
}
