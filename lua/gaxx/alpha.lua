local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}
dashboard.section.buttons.val = {
	dashboard.button("spc f f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("spc p p ","  Find project", ":Telescope projects <CR>"),
	dashboard.button("spc f r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("spc f t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("spc f p", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function pick_color()
  local colors = {"String", "Identifier", "Keyword", "Number"}
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1)
  local datetime = os.date("%d-%m-%Y  %H:%M:%S")
  return total_plugins .. " plugins  " .. datetime
end

dashboard.section.header.opts.hl = pick_color()
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
