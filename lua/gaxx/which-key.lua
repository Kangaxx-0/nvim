local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    c = {
      name = "Code",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
      f = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format file" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename file" },
      x = { "<cmd>Trouble<cr>", "List all"},
    },
    d = {
      name = "Debug",
      a = {"<cmd> lua require'dap'.toggle_breakpoint()<cr>",  "Breakpoint"},
      i = {"<cmd> lua require'dap'.step_into()<cr>",  "Step into"},
      o = {"<cmd> lua require'dap'.step_out()<cr>",  "Step out"},
      r = {"<cmd> lua require'dap'.repl.open()<cr>",  "Repl"},
      s = {"<cmd> lua require'dap'.continue()<cr>",  "Start/Stop/Continue debug"},
      t = {"<cmd> lua require'dapui'.toggle()<cr>",  "Toggle UI"},
    },
    f = {
      name = "File",
      f = { "<cmd>Telescope find_files<cr>", "Find files"},
      e = { "<cmd>ene <BAR> startinsert<cr>", "New Text"},
      n = { "<cmd>enew<cr>", "New File" },
      p = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Find private config" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files"},
    },
    g = {
      name = "Git/Go",
      g = { "<cmd>Neogit<cr>", "Neogit"},
      B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame"},
      -- Go debug settings
      o = {"<cmd> GoDebugStepOut<cr>", "Debug step out"},
      s = {"<cmd> GoDebugStart<cr>", "Debug start/continue"},
      t = {"<cmd> GoDebugStop<cr>",  "Debug stop"},
      v = {"<cmd> let g:go_debug_log_output=''<cr>",  "Turn off Verbose log"},
    },
    l = {
      name = "Lsp",
      f = { "<cmd>NullLsInfo<cr>", "NullLsInfo"},
      d = {
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        "Document Diagnostics",
      },
      w = {
        "<cmd>Telescope diagnostics<cr>",
        "Workspace Diagnostics",
      },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },
    o = {
      name = "Open",
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      m = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    },
    r = {
      name = "Rust",
      a = { "<cmd>RustRunnables<cr>", "Runnables" },
      b = { "<cmd>!cargo build<cr>", "Cargo Build" },
      c = { "<cmd>!cargo check<cr>", "Cargo Check" },
      r = { "<cmd>!cargo run<cr>", "Cargo Run" },
      t = { "<cmd>!cargo test<cr>", "Cargo Test" },
      T = { "<cmd>RustOpenCargo<cr>", "Cargo TOML" },
    },
    p = {
      name = "Project",
      p = { "<cmd>:Telescope projects<cr>", "Find project"},
    },
    S = {
      name = "Quit/session",
      s = { "<cmd>SaveSession<cr>", "Save session" },
      r = { "<cmd>RestoreSession<cr>", "Restore last session" },
    },
    s = {
      name = "Search",
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      p = { "<cmd>Telescope live_grep<cr>", "Find in project"},
    },
    w = {
      name = "Window",
      c = {"<cmd>quit<cr>", "kill split"},
      v = {"<cmd>vsplit<cr>", "split vertically"},
      s = {"<cmd>split<cr>", "split horizontally"},
      h = {"<C-w>h", "Move left window"},
      j = {"<C-w>j", "Move down window"},
      k = {"<C-w>k", "Move up window"},
      l = {"<C-w>l", "Move right window"},
    },
    -- ["<leader>"] = {
    --   name = "spc",
    --   q = { "<cmd>Bdelete<cr>", "Delete current buffer"},
    -- },
  },
})

-- Other key bindings
wk.register({
  ["<leader><leader>"] = {"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find" },
  ["<leader>q"] = {"<cmd>Bdelete<cr>", "Delete current buffer" },
  ["<M-1>"] = {"<cmd>NvimTreeToggle<cr>", "Open file explorer"},
  ["<M-f>"] = {"<cmd>SymbolsOutline<cr>", "Toggle Symbols outlines"},
})

