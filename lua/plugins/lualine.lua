return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		sections = {
			lualine_b = {
				'branch',
				'diff',
				{
					'diagnostics',
					sources = {'nvim_workspace_diagnostic'},
				},
				{
					'diagnostics',
					sources = {'nvim_diagnostic'},
				}
			},
			lualine_z = {}
		},
		inactive_sections = {
			lualine_a = {
				'diagnostics'
			},
			lualine_x = {'filetype'},
			lualine_z = {'progress'}
		},
		extensions = {
			'oil',
			'nvim-dap-ui',
			'trouble',
			'quickfix'
		}
	}
}
