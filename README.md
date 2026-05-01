# kape-nvim

A warm, dark Neovim colorscheme with a warm dark color scheme rooted in coffee, earth, and amber — built for long coding sessions.

> Part of the [Kape](https://github.com/gabiuz/kape) color system.

## Requirements

- Neovim ≥ 0.8
- A terminal with true color support (`termguicolors`)

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "gabiuz/kape-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("kape")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "gabiuz/kape-nvim",
  config = function()
    vim.cmd.colorscheme("kape")
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'gabiuz/kape-nvim'
colorscheme kape
```

## Usage

```lua
vim.cmd.colorscheme("kape")
```

To enable transparent backgrounds, call `setup()` before applying the colorscheme:

```lua
require("kape").setup({
  transparent = true, -- default: false
})
vim.cmd.colorscheme("kape")
```

## Supported Plugins

| Plugin | Status |
|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | ✅ |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ✅ |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | ✅ |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ✅ |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | ✅ |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ✅ |

> Integrations are loaded automatically. Plugins that are not installed are skipped safely.

## Palette

| Name | Hex | &nbsp; |
|---|---|---|
| `background` | `#181616` | ![#181616](https://placehold.co/16x16/181616/181616.png) |
| `foreground` | `#d4be98` | ![#d4be98](https://placehold.co/16x16/d4be98/d4be98.png) |
| `red` | `#b53535` | ![#b53535](https://placehold.co/16x16/b53535/b53535.png) |
| `green` | `#b4c76e` | ![#b4c76e](https://placehold.co/16x16/b4c76e/b4c76e.png) |
| `yellow` | `#e7bb5c` | ![#e7bb5c](https://placehold.co/16x16/e7bb5c/e7bb5c.png) |
| `blue` | `#7b8fd4` | ![#7b8fd4](https://placehold.co/16x16/7b8fd4/7b8fd4.png) |
| `purple` | `#b06880` | ![#b06880](https://placehold.co/16x16/b06880/b06880.png) |
| `aqua` | `#689d8a` | ![#689d8a](https://placehold.co/16x16/689d8a/689d8a.png) |

## License

See [LICENSE](./LICENSE).
