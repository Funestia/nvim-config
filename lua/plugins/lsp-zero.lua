return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },       -- Required
		{ 'williamboman/mason.nvim' },     -- Optional
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },            -- Required
		{ 'hrsh7th/cmp-nvim-lsp' },        -- Required
		{ 'hrsh7th/cmp-path' },
		{ 'L3MON4D3/LuaSnip' },            -- Required
		{ 'onsails/lspkind.nvim' },

		{
			'folke/trouble.nvim',
			config
		}

	},
	config = function()
		local lsp = require('lsp-zero').preset("recommended")
		local lspconfig = require('lspconfig')

		lspconfig.lua_ls.setup {
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- Depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				})
			end,
			settings = {
				Lua = {}
			}
		}
		lsp.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})
		lsp.ensure_installed({
			"rust_analyzer",
			"clangd",
			"lua_ls",
			"tsserver",
			"eslint"
		})
		lsp.on_attach(function(client, bufnr)
			vim.lsp.inlay_hint(bufnr)
		end)
		lsp.setup()
		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()
		cmp.setup({
			mapping = {
				['<CR>'] = cmp.mapping.confirm({ select = false }),
			},
			formatting = {
				fields = { 'abbr', 'kind', 'menu' },
				format = require('lspkind').cmp_format({
					mode = 'symbol',
					maxwidth = 50,
					ellipsis_char = '...',
				})
			},
		})
	end,
}
