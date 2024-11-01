# NvChad Customised

!! Since the last nvchad update you may need to delete some nvim folders !!

- `rm -r ~/.local/share/nvim`
- `rm -r ~/.local/state/nvim`

## Cute Dashboard (Customised)

<img width="1134" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/ac0bd860-e3ad-411a-9d36-323b1250cd12">

## Ready to work for these types of projects

- React, Javascript, Typescript
- Astro
- Markdown
- Lua
- html
- css

## How to install

- [Install Nvim](https://neovim.io/)
- `git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim`

### For Flatpack users

- Install NVIM from Flatpack
- Launch it one time
- Create nvim folder with `mkdir ~/.var/app/io.neovim.nvim/config/nvim`
- Create nvim alias with `echo "alias nvim="flatpak run io.neovim.nvim"" >> ./bashrc`
- Reload bash with by writting `bash` the terminal
- Then you can clone with `git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim`

#### Here is a one line command: (Still need to run nvim one time before)
- `mkdir ~/.var/app/io.neovim.nvim/config/nvim && echo "alias nvim="flatpak run io.neovim.nvim"" >> ./bashrc && bash && git clone https://github.com/t1gu1/nvchad ~/.config/nvim && nvim`

### Install Pre-requisites


- [Nerd Font](https://www.nerdfonts.com/) as your terminal font. Make sure the nerd font you set doesn't end with Mono to prevent small icons. Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono
- Ripgrep is required for grep searching with Telescope (OPTIONAL).
- GCC, Windows users must have mingw installed and set on path.
- Make, Windows users must have GnuWin32 installed and set on path.
- When you open the first time, always check your setup with the `:checkhealth` command

### Nice little plugins added & ajustment (Cause not mentionned later in this doc)

First there is an ajustement to not replace the yank by using `d`, `c`, `p` so you can copy and paste without the fear of replacing the yarnked buffer.

- `rainbow-delimiters`  | Make a rainbow with () {} [] - Easier to see the bloc
- `mini.cursorword`     | Underline all words similar to the one under the cursor
- `mini.surround`       | Sourround content with () {} [] "" ''
- `mini.move`           | Move line or selection
- `lspsaga`             | Nice Lsp action, debug, etc bubble
- `project.nvim`        | Added to NvDash quick find project
- `lazygit.nvim`        | An incredible way to have a git visual inside nvim

## Terminal is simple and keep the theme hilights (NvChad.term)

<img width="1029" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/14300c6c-51e7-48a7-9dd8-0f6a1a36f105">

## Nice way to access the terminal (Custom NvChad.term mapping)

### Simply use these shorcuts:

- `<leader>t` Open the last opened terminal (Create one if none created)
- `1<leader>t` Open the second terminal (Create one if none created)
- `2<leader>t` Open the second terminal (Create one if none created)
- `3<leader>t` Open the second terminal (Create one if none created)
- `4<leader>t` Open the second terminal (Create one if none created)
- `5<leader>t` Open the second terminal (Create one if none created)
- You get it. It works from `1` to `9`.

### An other way to switch or simply view opened terminal

Shortcut: Simply `t`

<img width="1550" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/889dc45c-fc48-4346-a5d2-c7c24813a80d">

## Nice nvim-tree & UI (Customised)

It's nice to know that it will auto close if you'll go out of focus or select a file.

<img width="1703" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/cd66209a-3347-4f26-a0ee-277689f69a6a">

## A Noice popup/box for searching and commands

This is what appear when you press `:` or `/`.
It remove that space at the bottom of the screen for that visual with nice context icons.

<img width="997" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/5046ccf0-a3ee-4e3f-a493-7dfa26e57782">
<img width="997" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/201dfb98-4b2f-4a4b-af47-6b11c2283007">

## Navigate Blazingly fast with Harpoon 2 (Added)

- `<leader>a` Add file in Harpoon
- `<leader>E` Show Harpoon explorer (This is a CAP E)
- `<leader>1` Open the second terminal (Create one if none created)
- `<leader>2` Open the second terminal (Create one if none created)
- `<leader>3` Open the second terminal (Create one if none created)
- `<leader>4` Open the second terminal (Create one if none created)
- `<leader>5` Open the second terminal (Create one if none created)
- You get it. It works from `1` to `9`.

<img width="1611" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/29fbd5df-d618-47bb-83ab-9a6f392140c3">

## Cheat Sheet - The BLAZINGLY FAST way to learn about this config shorcuts

`<leader>ch` Will open the Cheat Sheet

<img width="1627" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/18156a1c-2b61-42ae-882f-170bd8f7c40b">

## Even Telescope looks gorgeous

<img width="1560" alt="image" src="https://github.com/t1gu1/nvchad/assets/12479055/bd951f95-04ec-46f6-b197-248544c12e27">

## A lot of themes

![image](https://github.com/user-attachments/assets/9e7e5907-24e7-4f76-9b3b-65c21cc57732)

## Here is my Lazygit config
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
    quit-alt1: '<c-c>' # alternative/alias of quit
    return: 'q' # return to previous menu, will quit if there's nowhere to return
```

## On linux, you could install these if it is missing.
If x11

- xclip

If Wayland

- wl-copy and wl-paste
