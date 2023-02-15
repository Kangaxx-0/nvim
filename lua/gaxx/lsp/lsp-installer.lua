local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("gaxx.lsp.handlers").on_attach,
		capabilities = require("gaxx.lsp.handlers").capabilities,
	}

	local rust_opts = {
		on_attach = require("gaxx.lsp.handlers").on_attach,
		capabilities = require("gaxx.lsp.handlers").capabilities,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
					autoreload = true,
					allFeatures = true,
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
				},
			},
		},
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("gaxx.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	server:setup(rust_opts)
end)
