--[ Connecting extensions ]--
local hl = require("extensions.highlighter")
local utils = require("extensions.utils")



--[ Default Config ]--
local DEFAULT_CONFIG = {
	italics = true,					-- enable italics in general
	contrast = "medium",
	comments = {
		italics = true,				-- enable italic comments
	},
	background = {
		transparent = false,		-- set the background to transparent
	},
	float = {
		force_background = false,	-- force background on floats even when background.transparent is set
		background_color = nil,		-- set color for float backgrounds. If nil, uses the default color set
									-- by the color scheme
	},
	signs = {
		highlight = true,			-- whether to highlight signs
	},
	customize = nil,				-- customize the theme in any way you desire, see below what this
									-- configuration accepts
}



--[ Other Functions ]--
---Apply defaults to base
---@param base table
---@param defaults table
---@return table
local function apply_defaults(base, defaults)
	local res = utils.table_copy(base)
	for key, default in pairs(defaults) do
		local value = base[key]
		if value == nil then
			res[key] = default
		elseif type(value) == "table" then
			res[key] = apply_defaults(value, default)
		else
			res[key] = value
		end
	end
	return res
end



--[ Main Function ]--
local M = {}
function M.setup(config)
	-- Crossing configurations
	config = config or {}
	local cfg = apply_defaults(config, DEFAULT_CONFIG)

	-- Resetting colors in NeoVim
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "anderson"

	-- Applying new colors
	local highlighter = hl.build(cfg)
	local groups = require("extensions.groups").get()
	for group, options in pairs(groups) do
		highlighter:highlight(group, options)
	end
end

return M
