local utils = require('anderson.utils')
local highlights = require('anderson.highlights')

function set_default_global_options()
  local opts = {
    enable_italic_comment = 1,
    diagnostic_text_highlight = 0,
    diagnostic_virtual_text = 'grey',
    sign_column_background = 'none',
    transparent_background = 0
  }

  for key, val in pairs(opts) do
    -- add prefix
    local key = 'anderson_' .. key

    if vim.g[key] == nil then
      vim.g[key] = val
    end
  end
end

M = {}
function M.setup(cfg)
  if vim.g.loaded_anderson == 1 then
    return
  end
  vim.g.loaded_anderson = 1

  set_default_global_options()

  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "andrson"

  -- NOTE: I think we can refactor this, but I don't know how
  for group, colors in pairs(highlights.custom()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.syntax()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.highlight_groups()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.filetype_specific()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.treesitter()) do
    utils.highlight(group, colors)
  end

  for group, colors in pairs(highlights.plugin_specific()) do
    utils.highlight(group, colors)
  end
end
return M

