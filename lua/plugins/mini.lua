return {
	'echasnovski/mini.nvim',
	version = false,
	config = function ()
		require('mini.animate').setup {
			cursor = {
				enable = false,
			},
			scroll = {
				enable = false,
			}
		}
	end
}
