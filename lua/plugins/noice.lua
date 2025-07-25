return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		cmdline = {
--				view = "cmdline",
		},
		presets = {

			long_message_to_split= true,
			inc_rename = true,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function ()
				require("notify").setup {
					background_colour = "#000000",
				}
			end,
		lazy = false,
		},
		"hrsh7th/nvim-cmp",
	},
}
