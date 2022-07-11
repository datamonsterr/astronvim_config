local function vim_opt_toggle(user_opt, first, second)
  if first == nil then
    first = true
  end
  if second == nil then
    second = false
  end
  if vim.o[user_opt] == first then
    vim.opt[user_opt] = second
  else
    vim.opt[user_opt] = first
  end
end

return {
  n = {
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>dr"] = {
      function()
        local word = vim.fn.expand "<cword>"
        local rp = vim.fn.input "Replace with: "
        vim.cmd("%s/" .. word .. "/" .. rp .. "/g")
      end,
    },
    ["<A-g>"] = {
      function()
        local word = vim.fn.expand "<cword>"
        vim.cmd(string.format("silent exec '!goldendict %s'", word))
      end,
      silent = true,
      desc = "Goldendict",
    },
    ["<leader>q"] = { ":Bdelete!<cr>", desc = "Quit Buffer" },
    ["<leader>w"] = { ":WinShift<cr>", desc = "WinShift" },
    ["<leader>hl"] = { ":HopLineStart<cr>", desc = "Hop Line Start" },
    ["<leader>hp"] = { ":HopPattern<cr>", desc = "Hop Pattern" },
    ["<leader>hw"] = { ":HopWord<cr>", desc = "Hop Word" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    ["<leader>SD"] = { ":!rm -r /home/dat/.local/share/nvim/sessions/*<cr><cr>", desc = "Delete all sessions" },
    ["<leader>gg"] = {
      function()
        require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float", hidden = true }):toggle()
      end,
      desc = "Lazygit",
    },
    ["<leader>dh"] = { ":nohlsearch<cr>", desc = "No highlight" },
    ["<leader>ds"] = {
      function()
        vim_opt_toggle "spell"
      end,
      desc = "Spell",
    },
    ["<leader>dc"] = {
      function()
        vim_opt_toggle "cursorline"
      end,
      desc = "Cursorline",
    },
    ["<leader>dl"] = {
      function()
        vim_opt_toggle "cursorcolumn"
      end,
      desc = "Cursor Column",
    },
    ["<leader>dC"] = {
      function()
        vim_opt_toggle("conceallevel", 0, 2)
      end,
      desc = "Conceal",
    },
    ["<C-t>"] = {
      function()
        require("syntax-tree-surfer").select_current_node()
      end,
      desc = "Select current node",
    },
    ["<leader>sb"] = false,
    ["<leader>st"] = {
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Telescope",
    },
    ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
    ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["J"] = { "mzJ`z" },
    ["<C-w>x"] = { ":WinShift swap<cr>" },
    ["f"] = { ":HopChar1CurrentLine<cr>", desc = "Hop 1 Char Current Line" },
    ["F"] = { ":HopChar1<cr>", desc = "Hop 1 Char Whole Buf" },
    ["<A-c>"] = { ":VCoolor<cr>", desc = "VCoolor" },
    ["<b"] = false,
    [">b"] = false,
    ["<leader>h"] = false,
    ["<leader>tp"] = false,
    ["<leader>tl"] = false,
    ["<leader>tu"] = false,
    ["<leader>tt"] = false,
    ["<leader>tn"] = false,
    ["<leader>c"] = false,
    ["<leader>fh"] = false,
    ["<leader>u"] = false,
    ["<leader>o"] = false,
    ["<F9>"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    ["<leader>xb"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoints condition: ")
      end,
      desc = "Breakpoint with condition",
    },
    ["<leader>xc"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Clear Breakpoints",
    },
    ["<F10>"] = {
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    ["<leader>xq"] = {
      function()
        require("dap").close()
        require("dapui").close()
      end,
      desc = "Close Session",
    },
    ["<leader>xQ"] = {
      function()
        require("dap").terminate()
        require("dapui").close()
      end,
      desc = "Terminate",
    },
    ["<leader>xu"] = {
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Debugger UI",
    },
    ["<leader>fdc"] = {
      function()
        require("telescope").extensions.dap.commands {}
      end,
      desc = "Commands",
    },
    ["<leader>fdC"] = {
      function()
        require("telescope").extensions.dap.configurations {}
      end,
      desc = "Configurations",
    },
    ["<leader>fdb"] = {
      function()
        require("telescope").extensions.dap.list_breakpoints {}
      end,
      desc = "Breakpoints",
    },
    ["<leader>fdv"] = {
      function()
        require("telescope").extensions.dap.variables {}
      end,
      desc = "Variables",
    },
    ["<leader>fdf"] = {
      function()
        require("telescope").extensions.dap.frames {}
      end,
      desc = "Frames",
    },
    ["<leader>fz"] = {
      function()
        require("telescope").extensions.zoxide.list {}
      end,
      desc = "Zoxide",
    },
    ["<leader>pp"] = {
      function()
        require("telescope").extensions.packer.packer()
      end,
      desc = "Packer Search",
    },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
    J = {
      function()
        require("syntax-tree-surfer").surf("next", "visual")
      end,
      desc = "Next",
    },
    K = {
      function()
        require("syntax-tree-surfer").surf("prev", "visual")
      end,
      desc = "Prev",
    },
    H = {
      function()
        require("syntax-tree-surfer").surf("parent", "visual")
      end,
      desc = "Parent",
    },
    L = {
      function()
        require("syntax-tree-surfer").surf("child", "visual")
      end,
      desc = "Child",
    },
    ["<C-j>"] = {
      function()
        require("syntax-tree-surfer").surf("next", "visual", true)
      end,
      desc = "Swap Next",
    },
    ["<C-k>"] = {
      function()
        require("syntax-tree-surfer").surf("prev", "visual", true)
      end,
      desc = "Swap Prev",
    },
  },
  i = {
    ["<C-[>"] = {
      function()
        vim.notify("Use Capslock Key", "warn", { title = "Change your habit" })
      end,
    },
    ["<C-S>"] = { "<Esc>:w<cr>i", desc = "Save the file" },
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
  },
}
