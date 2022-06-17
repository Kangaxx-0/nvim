local status_ok, blame = pcall(require, "blame_line")
if not status_ok then
	return
end

blame.setup()
