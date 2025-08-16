# install brew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# use bash as default
#chsh -s /bin/bash # might ask for password

# remove bashrc incase it exists
rm ~/.bashrc

# compose bash config
eval 'export HOMEBREW_PREFIX="/Users/rodel.cabubas/homebrew"' >>~/.bashrc
echo 'export HOMEBREW_CELLAR="/Users/rodel.cabubas/homebrew/Cellar";' >>~/.bashrc
echo 'export HOMEBREW_REPOSITORY="/Users/rodel.cabubas/homebrew";' >>~/.bashrc
echo 'export PATH="/opt/homebrew/bin:$PATH";' >>~/.bashrc
echo 'export MANPATH="/Users/rodel.cabubas/homebrew/share/man${MANPATH+:$MANPATH}:";' >>~/.bashrc
echo 'export INFOPATH="/Users/rodel.cabubas/homebrew/share/info:${INFOPATH:-}";' >>~/.bashrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.bashrc
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >>~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >>~/.bashrc
echo 'eval "$(oh-my-posh init bash --config ~/mytheme.omp.json)"' >>~/.bashrc
echo 'if [ -f ~/.git-completion.bash ]; then' >>~/.bashrc
echo '  . ~/.git-completion.bash' >>~/.bashrc
echo 'fi' >>~/.bashrc
echo 'GPG_TTY=$(tty)' >>~/.bashrc
echo 'export GPG_TTY' >>~/.bashrc
echo 'export PATH=$PATH:/Users/rodel.cabubas/.spicetify' >>~/.bashrc
echo 'alias lg="lazygit"' >>~/.bashrc

# now we can use brew and install packages
brew install kitty # terminal
brew install lua   # language for nvim
brew install ripgrep
brew install nvim     # neovim as editor
brew install tmux     # for terminal session management
brew install ohmyposh # term aesthetics

# Fonts
brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
brew install --cask font-sf-mono-nerd-font-ligaturized
