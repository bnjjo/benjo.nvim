# benjo.nvim

This is a fork of [nvim.lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) optimized for my workflow.

### Custom binds

`<Leader> + d` --> expand diagnostic message that the cursor is currently hovering over<br>
`<Leader> + D` --> show all diagnostic messages<br>
`<Leader> + g` --> launch Lazygit<br>
`<Leader> + 1-9` --> quick switch between marked projects

### Custom commands
`:T` --> initialize a horizontal split with a terminal window on the left and automatically narrow it<br>
`:C` --> switch foucs to next split (assumed to be a terminal), run last command, then switch back (used for quick compilation and testing)<br>
`:CC` --> same as above except stay in terminal split and enter insert mode (useful for when terminal requests input)<br>

### Usage

```sh
git clone https://github.com/bnjjo/benjo.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Required

- [Lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
