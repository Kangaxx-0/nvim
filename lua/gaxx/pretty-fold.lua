local status_ok, fold = pcall(require, "pretty-fold")
if not status_ok then
	return
end

local preview_status_ok, preview = pcall(require, "pretty-fold.preview")
if not preview_status_ok then
	return
end

preview.setup_keybinding()
fold.setup{}
