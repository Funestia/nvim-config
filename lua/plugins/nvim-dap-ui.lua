return {
	'rcarriga/nvim-dap-ui',
	dependencies = {
		"nvim-neotest/nvim-nio"
	},
	config = function()
		local dapui = require('dapui')
		local dap = require('dap')
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
		dapui.setup()
	end
}
