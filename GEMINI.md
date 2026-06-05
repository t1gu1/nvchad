# Project Context: Neovim Configuration (NvChad based)

This repository contains a highly customized Neovim configuration built on top of [NvChad v2.5](https://github.com/NvChad/NvChad). It is optimized for web development (React, TypeScript, Astro), Lua, and various other languages.

## Project Overview

*   **Core Framework:** NvChad v2.5
*   **Plugin Manager:** `lazy.nvim`
*   **Theme:** `rosepine` (configured with transparency in `lua/chadrc.lua`)
*   **Key Technologies:**
    *   **LSP:** `nvim-lspconfig` with `lspsaga` and `fastaction.nvim` for UI.
    *   **Formatting:** `conform.nvim` (Prettier, Stylua).
    *   **Syntax Highlighting:** `nvim-treesitter`.
    *   **AI Integration:** `claude-code.nvim`.
    *   **Terminal:** Integrated floating terminals (`nvchad.term`).
    *   **File Explorer:** `nvim-tree.lua` (configured as a floating window).

## Architecture

The project follows the standard NvChad structure for overrides and extensions:

*   `init.lua`: The entry point. Bootstraps `lazy.nvim`, sets global variables (e.g., `base46_cache`), and loads modules.
*   `lua/chadrc.lua`: Primary UI and theme configuration. Controls the `base46` theme, statusline, tabufline, and dashboard (NvDash).
*   `lua/mappings.lua`: All custom keybindings and overrides for NvChad defaults.
*   `lua/options.lua`: Neovim-native options (e.g., indentation, line numbers).
*   `lua/plugins/init.lua`: Defines all custom plugins and overrides existing NvChad plugin configurations.
*   `lua/configs/`: Contains modular configuration files for major plugins:
    *   `lspconfig.lua`: LSP server setup and capabilities.
    *   `conform.lua`: Formatting rules.
    *   `mason.lua`: Tool management (LSP/DAP/Linter/Formatter installation).
    *   `treesitter.lua`: Syntax highlighting and parser configuration.

## Building and Running

*   **Launch:** Run `nvim` in the terminal.
*   **Plugin Management:**
    *   `:Lazy` - Open the Lazy.nvim UI.
    *   `:Lazy sync` - Synchronize plugins.
*   **Tool Management:**
    *   `:Mason` - Open the Mason UI to manage external binaries.
    *   `lua/configs/mason.lua` defines the list of `ensure_installed` tools.
*   **Health Check:** Run `:checkhealth` to verify the environment.

## Development Conventions

### Coding Style & Formatting
*   **Lua:** Use `stylua` for formatting (configured via `conform.nvim`).
*   **Web (JS/TS/CSS):** Use `prettierd` or `prettier`.
*   **Trigger:** Press `<C-s>` to format and save the current buffer.

### Key Mappings
*   **Leader Key:** `<Space>`
*   **Escape Insert Mode:** `jk`
*   **AI Interface:** `<leader>aa` toggles the Claude Code floating window.
*   **Git:** `<leader>gg` toggles Lazygit.
*   **Terminals:**
    *   `<leader>t` - Toggle last floating terminal.
    *   `[1-9]<leader>t` - Toggle specific numbered terminals.
*   **Navigation:**
    *   `Tab` / `Shift+Tab` - Cycle through buffers.
    *   `<leader>e` - Toggle the floating NvimTree explorer.
*   **LSP Actions:**
    *   `<leader>ca` - LSP Code Actions (via `fastaction`).
    *   `gd` - Go to definition.
    *   `gr` - LSP References.

### Adding New Features
*   **Plugins:** Add a new spec to `lua/plugins/init.lua`. If it requires extensive configuration, create a new file in `lua/configs/` and require it within the spec.
*   **Keymaps:** Add to `lua/mappings.lua`. Use the `M.general`, `M.lspconfig`, etc., structure.

## Technical Details for AI Assistance
*   **Base46 Cache:** NvChad uses a pre-compiled UI cache. Changes to UI settings in `chadrc.lua` usually require a restart or re-triggering the cache generation.
*   **Floating Windows:** Many UI elements (NvimTree, Terminal, Claude Code) are configured as floating windows for a modern, centered feel.
*   **LSP Servers:** Configured in `lua/configs/lspconfig.lua`. Currently includes `html`, `cssls`, `vtsls`, `astro`, `tailwindcss`, `gdscript`, and `gopls`.
