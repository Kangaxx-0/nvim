local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
	return
end

vim.g.gitblame_enabled = 1

gitblame.setup({
	gitblame_enabled = 1,
})
