local loaded_dap_install, dap_install = pcall(require, "dap-install")
if not loaded_dap_install then
  return
end

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config("chrome", {
  outFiles = {"${workspaceFolder}/build/**/*.js"},
})
