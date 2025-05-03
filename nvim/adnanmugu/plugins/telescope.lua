return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-symbols.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["C-k"] = actions.move_selection_previous,
						["C-j"] = actions.move_selection_next,
					},
				},
			},
		})

		-- keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set(
			"n",
			"<leader>ff",
			builtin.find_files,
			{ desc = "Telescope find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			builtin.live_grep,
			{ desc = "Telescope live grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			builtin.buffers,
			{ desc = "Telescope buffers" }
		)
		vim.keymap.set(
			"n",
			"<leader>fh",
			builtin.help_tags,
			{ desc = "Telescope help tags" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			builtin.symbols,
			{ desc = "Telescope symbols" }
		)
	end,
}
