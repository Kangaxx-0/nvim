local has = function(x)
  return vim.fn.has(x) == 1
end

if has("win32") then
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end

if has("wsl") then
  local clip = "/mnt/c/Windows/System32/clip.exe"
  --[[ local pwsh = "\"/mnt/c/Program Files/PowerShell/7/pwsh.exe\"" ]]
  --[[ local paste = pwsh .. ' -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))' ]]
  -- code of pwsh_clip.sh, and make sure powershell 7 is installed
  --   #!/bin/bash
  --   "/mnt/c/Program Files/PowerShell/7/pwsh.exe" -c "[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))"
  --
  local paste = "/home/gaxx/pwsh_clip.sh"
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = clip,
      ["*"] = clip,
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
    cache_enabled = 0,
  }
elseif has("linux") then
  -- hogehoge
end

if has("mac") then
  vim.opt.clipboard:append({ "unnamedplus" })
end
