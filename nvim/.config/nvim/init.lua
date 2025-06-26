require("vim-options")
require("config.lazy")

-- Desabilitar modifyOtherKeys ao sair
vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		io.write("\027[>4;0m")
		io.flush()
	end,
})
