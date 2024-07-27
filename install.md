# Step by step zsh and oh-my-zsh configuration

1. Update and upgrade your system

    `sudo apt update && sudo apt upgrade -y`
2. Install zsh

    `sudo apt install zsh -y`

    while install zsh follow steps [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
3. Configure basic zsh options by entering z-shell

    `zsh`
4. Set zsh as default shell

    `chsh -s $(which zsh)`
5. Check if everything went fine with:

    `$SHELL --version`
    that should return something like: `zsh 5.9 ...`
6. Install git

    `sudo apt install git`
7. Install oh-my-zsh via curl

    `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
8. Install brew

    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
9. Make brew usable in zsh, by adding this line at the end of the .zshrc file

    `eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`
10. Installing zsh-autosuggestions:

    - `brew install zsh-autosuggestions`
11. Installing zsh-syntax-highlighing

    - `sudo apt install zsh-syntax-highlighting`
    - `echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc` 
    - if this doesn't work, follow these [instructions](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
12. Clone zsh repository using git

    `git clone https://github.com/all0ver/zsh.git`
13. Install other tools:

    `sudo apt install fzf`
    
    `brew install bat`
    
    `brew install eza`
    
    `brew install tlrc`
15. Change your .zshrc file with .zshrc from this repository

    `mv .zshrc .zshrc.backup`
    
    `cp zsh/.zshrc .zshrc`
    
    `source .zshrc`
