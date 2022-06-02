local M = {}

M.split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end
M.include = function(item, table)
  for _, value in pairs(table) do
    if value == item then
      return true
    end
  end
  return false
end

return M
