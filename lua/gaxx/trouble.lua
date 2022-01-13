
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

local icon_status_ok, _ = pcall(require, "nvim-web-devicons")
if not icon_status_ok then
	return
end

trouble.setup{}
