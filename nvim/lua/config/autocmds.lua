-- color scheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.cmd("syntax on") -- enable syntax highlighting
vim.cmd("filetype plugin indent on") -- enable file-type specific indenting

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("redraw!")
	end,
})

-- terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- diagnostic
vim.diagnostic.config({
	virtual_text = { spacing = 1 },
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
