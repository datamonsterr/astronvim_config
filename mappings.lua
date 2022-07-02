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
    ["<leader>dC"] = {
      function()
        vim_opt_toggle("conceallevel", 0, 2)
      end,
      desc = "Conceal",
    },
    ["<C-x>"] = {
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
    ["<leader>xb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    ["<leader>xB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoints condition: ")
      end,
      desc = "Breakpoint with condition",
    },
    ["<leader>xC"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Clear Breakpoints",
    },
    ["<leader>xc"] = {
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    ["<leader>xi"] = {
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    ["<leader>xo"] = {
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
    ["<leader>xr"] = {
      function()
        require("dap").repl.toggle()
      end,
      desc = "REPL",
    },
    ["<leader>xu"] = {
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Debugger UI",
    },
    ["<leader>xv"] = { ":DapVirtualTextToggle<cr>", desc = "Virtual Text" },
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
  },
  i = {
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
  },
}
