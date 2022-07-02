local map = require("user.custom.utils").filetype_map

map("javascript", "n", "<F5>", ":!node %<cr>", { desc = "Run Js code" })
