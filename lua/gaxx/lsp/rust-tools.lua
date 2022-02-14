local codelldb_path = "/home/gaxx/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/adapter/codelldb"
local liblldb_path = "/home/gaxx/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/lldb/lib/liblldb.so"

local opts = {
	-- debugging stuff
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
	-- dap = {
	-- 	adapter = {
	-- 		type = "executable",
	-- 		command = "lldb-vscode",
	-- 		name = "rt_lldb",
	-- 	},
	-- },
}

require("rust-tools").setup(opts)
