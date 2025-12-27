# benjo.nvim

This is a fork of [nvim.lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) optimized for my workflow.

## Custom binds

| Keybind | Action |
|---------|--------|
| `<Leader> + d` | Expand diagnostic message that the cursor is currently hovering over |
| `<Leader> + D` | Show all diagnostic messages |
| `<Leader> + g` | Launch Lazygit |
| `<Leader> + 1-9` | Quick switch between marked projects |

## Custom commands

| Command | Action |
|---------|--------|
| `:T` | Initialize a horizontal split with a terminal window on the left and automatically narrow it |
| `:C` | Switch focus to next split (assumed to be a terminal), run last command, then switch back (used for quick compilation and testing) |
| `:CC` | Same as above except stay in terminal split and enter insert mode (useful for when terminal requests input) |

### Usage

```
git clone https://github.com/bnjjo/benjo.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Required

- [Lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
