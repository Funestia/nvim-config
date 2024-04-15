return {
	'nvimdev/lspsaga.nvim',
	config = function()
		local lspsaga = require('lspsaga')
		lspsaga.setup({})
		lspsaga.LightBulb = {
			enable = true
		}
	end,
	event = 'LspAttach',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons'
	}
}
