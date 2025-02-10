#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)
# Install pyenv dependencies and pyenv
brew install openssl readline sqlite3 xz zlib
brew install pyenv

cp .zshrc ~/.zshrc
# Add pyenv to shell
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# Reload shell configuration
source ~/.zshrc

# Install Python 3.13.2 using pyenv
pyenv install 3.13.2
pyenv global 3.13.2

# Install Ansible
brew install ansible

# Install Ansible requirements
ansible-galaxy install -r requirements.yml

# Run Ansible playbook
ansible-playbook main.yml --ask-become-pass


curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg" && sudo installer -pkg AWSCLIV2.pkg -target /


sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

brew install fzf 
brew install gimme-aws-creds
brew install awscli
brew install terraform
brew install kubectl
brew install kubie
brew install colima
brew install --cask snipaste
brew install --cask iterm2
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask gotiengviet
brew install --cask cursor
brew install --cask singlebox
sudo -H pip install credstash
