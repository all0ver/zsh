# zsh with oh-my-zsh configuration

***theme based on ['intheloop'](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/intheloop.zsh-theme) theme but minimalized***

![image](https://github.com/all0ver/zsh/assets/60571521/0c83bf08-49e7-41ff-b81c-84dea0b825b1)

## Install

Clone the repo and run the install script:

```bash
git clone https://github.com/all0ver/zsh.git && bash zsh/install.sh
```

Or run it directly without cloning:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/all0ver/zsh/main/install.sh)
```

> After install, log out and back in (or open a new terminal) for the shell change to take effect.

## What the script installs

| Tool | How |
|---|---|
| zsh | `apt` |
| git | `apt` |
| zsh-syntax-highlighting | `apt` |
| [Homebrew](https://brew.sh) | official install script |
| zsh-autosuggestions | `brew` |
| [bat](https://github.com/sharkdp/bat) — `cat` alternative | `brew` |
| [eza](https://github.com/eza-community/eza) — `ls` alternative | `brew` |
| [oh-my-zsh](https://ohmyzsh.sh) | official install script |

The script is **idempotent** — safe to re-run; already-installed tools are skipped.
