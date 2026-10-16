# Neovim Configuration

[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.12-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim/releases/tag/stable)
[![Check Lua Formatting](https://github.com/ytoso/nvim/actions/workflows/stylua.yml/badge.svg)](https://github.com/ytoso/nvim/actions/workflows/stylua.yml)

A personal Neovim configuration built around [lazy.nvim](https://github.com/folke/lazy.nvim).
Simple, modular, and readable — every plugin lives in its own file.

## Requirements

- Neovim `>= 0.12`
- [git](https://git-scm.com/) (lazy.nvim is bootstrapped automatically)
- [ripgrep](https://github.com/BurntSushi/ripgrep) — for Telescope live grep
- Language servers: `pyright`, `clangd`
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- Python debugger: a `debugpy` virtualenv at `~/.virtualenvs/debugpy/bin/python`

## Installation

```sh
git clone https://github.com/ytoso/nvim.git ~/.config/nvim
```

Run `nvim` and lazy.nvim will install all plugins on first launch.

## Structure

```
~/.config/nvim
├── init.lua              # entry point
├── lua/
│   ├── config/lazy.lua   # lazy.nvim bootstrap + setup
│   ├── options.lua       # editor options
│   ├── mappings.lua      # keybindings
│   └── plugins/          # one file per plugin
├── ftplugin/             # per-filetype config (c, cpp, cuda, lua, python)
└── .github/workflows/    # CI (StyLua formatting check)
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme (mocha) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & parsing |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP setup |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (format on save) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the gutter |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Debugging (Python) |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI |
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Session management |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Terminal & misc. utilities |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown preview |
| [pi-nvim](https://github.com/carderne/pi-nvim) | Send code to the pi coding agent |

## Keybindings

`<leader>` is <kbd>Space</kbd>.

### General

| Key | Action |
| --- | --- |
| `<C-h/j/k/l>` | Switch window left/down/up/right |
| `<Esc>` | Clear search highlights |
| `<C-s>` | Save file |
| `<C-c>` | Copy whole file |
| `<leader>y` | Copy to system clipboard (visual) |
| `<leader>p` | Paste from system clipboard |
| `<leader>/` | Toggle comment |
| `gd` | Go to definition (LSP) |
| `grr` | Find references (LSP) |

### Format

| Key | Action |
| --- | --- |
| `<leader>q` | Format buffer / selection (visual) |

### File explorer (nvim-tree)

| Key | Action |
| --- | --- |
| `<C-n>` | Toggle file tree |
| `<leader>e` | Focus file tree |
| `<leader>ef` | Reveal current file in tree |

### Find (Telescope)

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files (incl. hidden/ignored) |
| `<leader>fw` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fs` | Document symbols |

### Debugging (nvim-dap)

| Key | Action |
| --- | --- |
| `<F5>` | Continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set breakpoint |
| `<leader>lp` | Set log point |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>dh` | Hover |
| `<leader>dp` | Preview |
| `<leader>df` | Frames |
| `<leader>ds` | Scopes |

### Sessions

| Key | Action |
| --- | --- |
| `<leader>qs` | Load session for current directory |

### Terminal

| Key | Action |
| --- | --- |
| `<C-/>` | Toggle terminal |
| `<C-x>` | Exit terminal mode (from within a terminal) |

### pi (coding agent)

| Key | Action |
| --- | --- |
| `<leader>ap` | Send prompt |
| `<leader>af` | Send file |
| `<leader>as` | Send selection (visual) |
| `<leader>ab` | Send buffer |
| `<leader>ai` | Ping |

### Code outline (aerial)

| Key | Action |
| --- | --- |
| `<C-m>` | Toggle outline on the left |

## Formatting

[conform.nvim](https://github.com/stevearc/conform.nvim) formats code on save.
Lua files use [StyLua](https://github.com/JohnnyMorganz/StyLua) as the formatter.

The repo is kept StyLua-clean by a GitHub Actions workflow
(`.github/workflows/stylua.yml`) that runs `stylua --check .` on every push and PR.

## LSP & Language Support

- **Python** — `pyright` (LSP) and `debugpy` (DAP).
- **C / C++ / CUDA** — `clangd` (LSP), enabled via `ftplugin/`.

## Debugging Python Remotely

The `ftplugin/python.lua` ships with an "Attach remote debugpy" configuration.
Start `debugpy` on the target machine, then attach from Neovim:

```sh
python -m debugpy --listen 127.0.0.1:5678 --wait-for-client your_script.py
```

The config maps the local working directory to `/home/user/Codes/<repo-name>`
on the remote — adjust `pathMappings` in `ftplugin/python.lua` to match your setup.
