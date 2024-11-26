# NvChad Customised

## Important Note
Since the last NvChad update, you may need to delete some nvim folders:
- `rm -r ~/.local/share/nvim`
- `rm -r ~/.local/state/nvim`

## Cute Dashboard (Customised)
<img width="1134" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/ac0bd860-e3ad-411a-9d36-323b1250cd12">

## Supported Projects
- React, Javascript, Typescript
- Astro
- Markdown
- Lua
- HTML
- CSS

## Installation
1. [Install Nvim](https://neovim.io/)
2. `git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim`

### For Flatpak Users
1. Install NVIM from Flatpak
2. Launch it once
3. Create nvim folder: `mkdir ~/.var/app/io.neovim.nvim/config/nvim`
4. Create nvim alias: `echo "alias nvim='flatpak run io.neovim.nvim'" >> ~/.bashrc`
5. Reload bash: `source ~/.bashrc`
6. Clone the repo: `git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim`

### One-line Command for Flatpak Users
```sh
mkdir ~/.var/app/io.neovim.nvim/config/nvim && echo "alias nvim='flatpak run io.neovim.nvim'" >> ~/.bashrc && source ~/.bashrc && git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim
```

### Pre-requisites
- [Nerd Font](https://www.nerdfonts.com/) as your terminal font. Avoid fonts ending with Mono.
- Ripgrep for grep searching with Telescope (optional).
- Run `:checkhealth` after opening nvim for the first time.

### Windows Users
- Install GCC and add it to PATH.
- Install Make (GnuWin32) and add it to PATH.

## Plugins and Adjustments
- `rainbow-delimiters`: Colorful delimiters for (), {}, []
- `mini.cursorword`: Underline words similar to the one under the cursor
- `mini.surround`: Surround content with (), {}, [], "", ''
- `mini.move`: Move lines or selections
- `lspsaga`: Enhanced LSP actions and debugging
- `project.nvim`: Quick project finder in NvDash
- `lazygit.nvim`: Git integration inside nvim

### Using mini.surround
- `sr)"`: Replace () with ""
- `sr]}`: Replace [] with {}
- `sd)"`: Delete surrounding ()
- `sd]}`: Delete surrounding []
- `saiw"`: Add "" around the word under the cursor
- `viwsa"`: Add "" around the word under the cursor (slower)

## Terminal Integration (NvChad.term)
<img width="1029" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/14300c6c-51e7-48a7-9dd8-0f6a1a36f105">

### Terminal Shortcuts
- `<leader>t`: Open the last terminal (or create one)
- `1<leader>t` to `9<leader>t`: Open specific terminals (or create them)

### Switch or View Opened Terminals
- Shortcut: `t`
<img width="1550" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/889dc45c-fc48-4346-a5d2-c7c24813a80d">

## Nvim-tree & UI (Customised)
Auto-closes when out of focus or a file is selected.
<img width="1703" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/cd66209a-3347-4f26-a0ee-277689f69a6a">

## Noice Popup/Box for Searching and Commands
Appears when you press `:` or `/`, removing the bottom screen space.
<img width="997" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/5046ccf0-a3ee-4e3f-a493-7dfa26e57782">
<img width="997" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/201dfb98-4b2f-4a4b-af47-6b11c2283007">

## Navigate Fast with Harpoon 2 (Added)
Harpoon changes based on the project branch.
- `<leader>a`: Add file in Harpoon
- `<leader>E`: Show Harpoon explorer (CAP E)
- `<leader>1` to `<leader>9`: Open specific terminals (or create them)
<img width="1611" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/29fbd5df-d618-47bb-83ab-9a6f392140c3">

## Cheat Sheet
- `<leader>ch`: Open the Cheat Sheet
<img width="1627" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/18156a1c-2b61-42ae-882f-170bd8f7c40b">

## Gorgeous Telescope
<img width="1560" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/bd951f95-04ec-46f6-b197-248544c12e27">

## Themes
![image](https://github.com/user-attachments/assets/9e7e5907-24e7-4f76-9b3b-65c21cc57732)

## Lazygit Config
```yml
gui:
  theme:
    activeBorderColor:
      - '#00ffa5'
      - bold
    inactiveBorderColor:
      - '#a5adcb'
    optionsTextColor:
      - '#00ebd7'
    selectedLineBgColor:
      - '#262a3f'
    cherryPickedCommitBgColor:
      - '#494d64'
    cherryPickedCommitFgColor:
      - '#8bd5ca'
    unstagedChangesColor:
      - '#ed8796'
    defaultFgColor:
      - '#cad3f5'
    searchingActiveBorderColor:
      - '#eed49f' 

keybinding:
  universal:
    quit: '<esc>'
    quit-alt1: '<c-c>'
    return: 'q'
```

## Linux Installation
### If x11
- Install `xclip`

### If Wayland
- Install `wl-copy` and `wl-paste` (Now it is under `wl-clipboard` I think)
```
