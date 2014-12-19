#!/bin/sh
#
# install personal dotfiles
#

set -e

GIT_VERSION=$(git --version)
PIP_VERSION=$(pip2 --version)
DOTFILES_REPO="git://git.femto.urd1.local/jdoe/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_ENTRIES="ackrc colordiffrc gitignore hgrc kermrc oh-my-zsh tmux.conf vim vimrc"
POWERLINE_URL="https://raw.github.com/Lokaltog/powerline/develop/font"
EXTRA_DIRS="$HOME/.vimbackup $HOME/.fonts $HOME/.config/fontconfig/conf.d $HOME/.config/mc/skins"
EXTRA_FILES="mc/skins/solarized.ini"

if [ -z "$GIT_VERSION" ]; then
	echo "Please install git"
	exit 1
fi

if [ -z "$PIP_VERSION" ]; then
	echo "Please install pip"
	exit 1
fi

if [ ! -d "$DOTFILES_DIR" ]; then
	git clone --recursive "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

pushd "$DOTFILES_DIR" > /dev/null

git submodule init
git submodule update
git submodule foreach git pull origin master

for dotfile in $DOTFILES_ENTRIES; do
	if [ -h "$HOME/.$dotfile" ]; then
		rm "$HOME/.$dotfile"
	fi

	if [ -f "$HOME/.$dotfile" ]; then
		continue
	fi
	ln -s "$DOTFILES_DIR/$dotfile" "$HOME/.$dotfile"
done

if [ ! -f "$HOME/.zshrc" ]; then
	cp "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
fi

for dir in $EXTRA_DIRS; do
	if [ ! -d "$dir" ]; then
		mkdir -p "$dir"
	fi
done

for file in $EXTRA_FILES; do
	if [ !-e "$HOME/.config/$file" ]; then
		ln -s "$DOTFILES_DIR/$file" "$HOME/.config/$file"
	fi
done

curl -s -k "$POWERLINE_URL/PowerlineSymbols.otf" \
	-o "$HOME/.fonts/PowerlineSymbols.otf"
curl -s -k "$POWERLINE_URL/10-powerline-symbols.conf" \
	-o "$HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf"

pip2 install --user git+git://github.com/Lokaltog/powerline

if [ ! -e $HOME/.config/powerline ]; then
	ln -s $DOTFILES_DIR/powerline $HOME/.config
fi

popd > /dev/null
exit 0
