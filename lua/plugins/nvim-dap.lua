return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require('dap')
		vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
		vim.keymap.set('n', '<F5>', dap.continue)
		vim.keymap.set('n', '<F10>', dap.step_over)
		vim.keymap.set('n', '<F11>', dap.step_into)
		vim.keymap.set('n', '<S-F11>', dap.step_out)
		vim.keymap.set('n', '<S-F5>', dap.terminate)

		dap.adapters.lldb = {
			type = 'executable',
			command = '/usr/bin/lldb-vscode',
			name = 'lldb'
		}
		dap.configurations.cpp = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
			}
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,

				initCommands = function()
					local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
					local script_import = 'command script import "' ..
						rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

					local commands = {}
					local file = io.open(commands_file, 'r')
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
						file:close()
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
			}
		}
	end,
}
