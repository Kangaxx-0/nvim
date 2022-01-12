local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lsp loading error!")
	return
end

require("gaxx.lsp.lsp-installer")
require("gaxx.lsp.handlers").setup()
require("gaxx.lsp.null-ls")
require("gaxx.lsp.go")
