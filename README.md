# Anderson Color Scheme
Port of the Anderson color scheme rewritten for NeoVim in Lua.
[Gruvbox-Material.nvim](https://github.com/WIttyJudge/gruvbox-material.nvim) was taken as a basis.

## Palette
![AndersonDark](/anderson.png)


## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install via your favourite package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'HASSIIYY/anderson.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'HASSIIYY/anderson.nvim'
```

[lazy](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
	{ 'HASSIIYY/anderson.nvim' },
})
```

## 🚀 Usage

Load the colors scheme:

Lua:

```lua
require('anderson').setup()
-- or
vim.cmd('colorscheme anderson')
```

Vim script:

```vim
colorscheme anderson
```

