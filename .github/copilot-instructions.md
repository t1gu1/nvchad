# Copilot Instructions

This repository is a personal Neovim configuration built on top of [NvChad v2.5](https://github.com/NvChad/NvChad), using `lazy.nvim` as the plugin manager. It is installed to `~/.config/nvim`.

## Architecture & Load Order

Understanding the boot sequence in `init.lua` is essential — it is not obvious from any single file:

1. Bootstraps `lazy.nvim`, then loads `NvChad/NvChad` (branch `v2.5`, imports `nvchad.plugins`) followed by the local `plugins` module.
2. Loads the base46 theme cache (`defaults`, `statusline`) from `vim.g.base46_cache` (`stdpath("data")/base46/`). These are generated files, not in the repo.
3. Requires `options` → `autocmds`, then schedules `mappings` (deferred so NvChad mappings load first).
4. Patches `vim.filetype.get_option` to feed `ts_context_commentstring` context-aware `commentstring` (e.g. correct comments inside JSX/TSX).

Every custom module layers on top of an NvChad base: `options.lua` requires `nvchad.options`, `autocmds.lua` requires `nvchad.autocmds`, `mappings.lua` requires `nvchad.mappings`, `lspconfig.lua` calls `nvchad.configs.lspconfig.defaults()`. **Always preserve the `require "nvchad.*"` call at the top of these files** — removing it drops the upstream defaults.

### File map

- `lua/chadrc.lua` — NvChad UI/theme config (theme, transparency, `hl_override`, statusline/tabufline order, floating terminal geometry, dashboard). Primary place for visual changes. Must match the structure of [nvconfig.lua](https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua).
- `lua/plugins/init.lua` — All custom plugin specs and overrides of NvChad plugin defaults.
- `lua/configs/` — Per-plugin config modules: `lspconfig.lua`, `conform.lua`, `mason.lua`, `treesitter.lua`, `lazy.lua`.
- `lua/mappings.lua`, `lua/options.lua`, `lua/autocmds.lua` — custom keymaps / options / autocommands.

## Conventions

- **Plugin config pattern:** in `lua/plugins/init.lua`, either inline `opts = { ... }`/`config = function()`, or point `opts`/`config` at a module under `lua/configs/`. Heavier configs (lsp, conform, mason, treesitter) live in their own file under `lua/configs/`; small ones stay inline. Follow this split when adding plugins.
- **Lazy loading:** most non-essential plugins use `event = "VeryLazy"`, or `ft`/`cmd`/`keys` for on-demand loading. Prefer this over eager loading.
- **Formatting (stylua):** `.stylua.toml` sets 2-space indent, 120 column width, double quotes (`AutoPreferDouble`), `call_parentheses = "None"` — so `require "module"` and `opts {}` are written without parentheses. Match this style; some existing files use tabs and will be normalized by stylua.
- **Leader key** is `<Space>`. Custom mappings use `vim.keymap.set` (aliased `map`) with a `desc` for the cheatsheet.

## LSP, Formatting & Tooling

- **LSP servers** (`lua/configs/lspconfig.lua`): enabled via `vim.lsp.enable(servers)` — `html`, `cssls`, `vtsls`, `astro`, `tailwindcss`, `gdscript`, `gopls`.
- **Formatters** (`lua/configs/conform.lua`): `prettierd` → `prettier` (fallback) for JS/TS/JSON/HTML/CSS/Astro/Tailwind; `stylua` for Lua. `lsp_format = "fallback"`. Format-on-save is opt-in (commented `event = "BufWritePre"`); formatting is triggered manually via `<C-s>`.
- **Mason** (`lua/configs/mason.lua`): `auto_install = true` with an `ensure_installed` list. Add new servers/formatters/linters here **and** register them in `lspconfig.lua` (servers) or `conform.lua` (formatters) so they are actually used.
- **Treesitter** (`lua/configs/treesitter.lua`): grammars listed in `ensure_installed`; add new languages here.

There is no build step, test suite, or CI — this is runtime Lua config. To validate changes:

- Run `:Lazy sync` (install/clean/update) or `:Lazy` to inspect plugin state. `lazy-lock.json` pins versions; commit it when intentionally updating.
- Run `:checkhealth` and `:messages` to surface load/config errors.
- Lint Lua manually with `luacheck` and format with `stylua .` (both installed via Mason).
- After major NvChad updates that misbehave, clear caches: `rm -r ~/.local/share/nvim` and `rm -r ~/.local/state/nvim` (see README).

## Notable Custom Mappings

Leader is `<Space>`. (See `lua/mappings.lua` for the full set.)

- `<C-s>` — `conform` format + write.
- `<leader>aa` — toggle Claude Code; `<leader>ac` — Copilot CLI float; `<leader>gg` — Lazygit float.
- `<leader>t` — toggle last-used floating terminal; `<id><leader>t` (1–9) — numbered floating terminals.
- `<leader>e` / `<leader>E` — toggle NvimTree (float, opens on the right).
- `<leader>ca` — `fastaction` LSP code action; `<leader>fw` — Telescope live grep (fixed strings).
- `jk` — exit insert mode; `;` — enter command mode; `<leader>qq` — quit.
- `<S-hjkl>` / `<S-arrows>` — move line/selection via `mini.move`.
- Visual `d`/`p` are remapped to the black-hole register so deletes/pastes don't clobber the yank.

## Supported Project Types

JS/TS/React, Astro, Markdown, Lua (incl. LÖVE/`love2d` auto-setup when a `main.lua` referencing `love.` is in cwd), HTML, CSS, Godot (`gdscript`), and Go.
