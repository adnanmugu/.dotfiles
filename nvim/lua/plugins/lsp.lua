return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim", -- package manager
		"williamboman/mason-lspconfig.nvim", -- package manager
		"j-hui/fidget.nvim", -- frontend
		"brenoprata10/nvim-highlight-colors", -- colors highlight for css
		"ray-x/lsp_signature.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
	},
	config = function()
		require("render-markdown").setup({
			completion = { lsp = { enabled = true } },
		})

		local blink = require("blink.cmp")
		local hexacolor = require("nvim-highlight-colors")

		local default_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = vim.tbl_deep_extend(
			"force",
			default_capabilities,
			blink.get_lsp_capabilities({}, false)
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"cssls",
				"ts_ls",
				"basedpyright",
				"jsonls",
			},

			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- completion engine config
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								format = {
									enable = true,
									-- Put format options here
									-- NOTE: the value should be STRING!!
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									},
								},
							},
						},
					})
				end,

				["cssls"] = function()
					require("lspconfig").cssls.setup({
						capabilities = capabilities,
						filetypes = { "css", "scss", "less" },
						settings = {
							css = { validate = true },
							scss = { validate = true },
							less = { validate = true },
						},
					})
				end,

				["ts_ls"] = function()
					local lspconfig = require("lspconfig")
					local capab = require("blink.cmp").get_lsp_capabilities({
						textDocument = {
							completion = {
								completionItem = { snippetSupport = true },
							},
						},
					})

					lspconfig.ts_ls.setup({
						capabilities = capab,
						filetypes = { "ts", "js", "jsx" },
						iniit_options = {
							hostInfo = "neovim",
							preferences = {
								completeFunctionCalls = true,
							},
						},
					})
				end,

				["basedpyright"] = function()
					require("lspconfig").basedpyright.setup({
						capabilities = capabilities,
						filetypes = { "python" },
						settings = {
							basedpyright = {
								analysis = {
									diagnosticMode = "openFilesOnly",
									typeCheckingMode = "basic",
									capabilities = capabilities,
									useLibraryCodeForTypes = true,
									diagnosticSeverityOverrides = {
										autoSearchPaths = true,
										enableTypeIgnoreComments = false,
										reportGeneralTypeIssues = "none",
										reportArgumentType = "none",
										reportUnknownMemberType = "none",
										reportAssignmentType = "none",
									},
								},
							},
						},
					})
				end,

				["jsonls"] = function()
					require("lspconfig").jsonls.setup({
						capabilities = capabilities,
						filetypes = { "json" },
					})
				end,
				-- end
			},
		})

		hexacolor.setup({
			render = "virtual",
			virtual_symbol = "◼",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "inline",
		})

		local lsp_signature_config = {
			floating_window_off_x = 1,
			floating_window_off_y = 0,
			keymaps = {
				{ "j", "<C-o>j" },
				{ "k", "<C-o>k" },
			},
		}

		require("lsp_signature").setup(lsp_signature_config)
	end,
}
