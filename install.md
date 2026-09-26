# Step by step zsh and oh-my-zsh configuration

1. Update and upgrade your system

    `sudo apt update && sudo apt upgrade -y`

2. Install zsh

    `sudo apt install zsh -y`

    To set zsh as your default shell, follow the steps [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

3. Set zsh as default shell

    `chsh -s $(which zsh)`

4. Verify the change (restart your terminal first)

    `$SHELL --version`

    Should return something like: `zsh 5.9 ...`

5. Install git

    `sudo apt install git`

6. Install oh-my-zsh via curl

    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

7. Install brew

    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

8. Make brew available in zsh — add this line to the end of your `~/.zshrc`

    `eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`

    Then reload: `source ~/.zshrc`

9. Install zsh-autosuggestions

    `brew install zsh-autosuggestions`

    Add to `~/.zshrc`:

    `source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh`

10. Install zsh-syntax-highlighting

    `sudo apt install zsh-syntax-highlighting`

    Add to `~/.zshrc`:

    `source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`

    If this doesn't work, follow these [instructions](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

11. Install other tools

    `brew install bat`

    `brew install eza`

12. Clone this repository and apply the config

    `git clone https://github.com/all0ver/zsh.git`

    `mv ~/.zshrc ~/.zshrc.backup`

    `cp zsh/.zshrc ~/.zshrc`

    `source ~/.zshrc`
