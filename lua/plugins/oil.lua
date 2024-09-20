function _G.get_oil_windbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		return vim.api.nvim_buf_get_name(0)
	end
end

local detail = false

return {
	'stevearc/oil.nvim',
	--@module 'oil'
	--@type oil.SetupOpts
	opts = {
		columns = {
			"icon",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		promt_save_on_select_new_entry = false,
		watch_for_changes = true,
		win_options = {
			winbar = "%!v:lua.get_oil_windbar()",
		},
		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({"icon", "permissions", "size"})
					else
						require("oil").set_columns({"icon"})
					end
				end,
			},
		},
		view_options = {
			natural_order = true,
			case_insensitive = true,
			is_hidden_file = function (name, bufnro)
				return vim.startswith(name, ".") and not vim.startswith(name, "..")
			end
		}
	},
	dependencies = {
		{
			"echasnovski/mini.icons", opts = {}
		}
	},
}
