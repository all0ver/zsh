# before starting download:
# 	1. homebrew:
# 	https://brew.sh/
/bin/bash
apt update -y && sudo apt upgrade -y
apt install zsh -y
apt install git -y

# installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# installing other tools
apt install fzf -y
brew install bat
brew install eza
brew install tlrc

# installing zsh-autosuggestions and zsh-syntax-highlighting
# 1. zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 2. zsh-autosuggestions
brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

cd
apt install gh -y
mv zsh/.zshrc .zshrc
reboot
