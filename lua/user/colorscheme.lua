vim.cmd[[ colorscheme default ]]

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found')
  return
end

vim.g.tokyonight_style= 'day'
vim.cmd[[colorscheme tokyonight]]