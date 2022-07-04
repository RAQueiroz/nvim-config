vim.cmd([[ colorscheme default ]])

local colorschemes = {
  tokyo = "tokyonight",
  nord = "onenord"
}

local colorscheme = colorschemes.nord

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found")
	return
end

if colorscheme == colorschemes.tokyo then
  vim.g.tokyonight_style = "storm"
  vim.cmd([[colorscheme tokyonight]])
end

if colorscheme == colorschemes.nord then
  require('onenord').setup({
    theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
    borders = true, -- Split window borders
    fade_nc = false, -- Fade non-current windows, making them more distinguishable
    styles = {
      comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
      strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
      keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
      functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
      variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
      diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
    },
    disable = {
      background = false, -- Disable setting the background color
      cursorline = false, -- Disable the cursorline
      eob_lines = true, -- Hide the end-of-buffer lines
    },
    custom_highlights = {}, -- Overwrite default highlight groups
    custom_colors = {}, -- Overwrite default colors
  })
end
