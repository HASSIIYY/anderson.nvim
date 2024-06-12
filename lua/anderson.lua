--[ Connecting extensions ]--
local hl = require("extensions.highlighter")
local utils = require("extensions.utils")



--[ Default Config ]--
local DEFAULT_CONFIG = {
  italics = true,
  contrast = "medium",
  comments = {
    italics = true,
  },
  background = {
    transparent = false,
  },
  float = {
    force_background = false,
    background_color = nil,
  },
  signs = {
    highlight = true,
  },
  customize = nil,
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
  config = config or {}
  local cfg = apply_defaults(config, DEFAULT_CONFIG)

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "anderson"

  local highlighter = hl.build(cfg)
  local groups = require("extensions.groups").get(cfg.contrast)
  for group, options in pairs(groups) do
    highlighter:highlight(group, options)
  end
end

return M
