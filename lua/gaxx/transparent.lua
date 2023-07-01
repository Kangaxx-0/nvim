
local status_ok, configs = pcall(require, "transparent")
if not status_ok then
	return
end

configs.setup({ 
    groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {
    "NvimTreeNormal"
  }, -- table: additional groups that should be cleared
  exclude_groups = {}, --

})
