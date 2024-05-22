#!/bin/bash

# this line ensures that the $HOME/bin directory exists, and creates it if it does not.
# and same for nvim and lua and after 
[[ -d "$HOME/bin" ]] || mkdir "$HOME/bin"

# check if you Already have nvim and if not download it 
if [[ $(uname) == "Darwin" ]]; then
	cd "$HOME/bin"
	FILE="nvim-macos.tar.gz"
	nvim --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading nvim..."
		curl -# -OL 'https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-macos.tar.gz'
		tar xzf nvim-macos.tar.gz
		rm $FILE
		ln -s nvim-macos/bin/nvim nvim
	fi

	tput setaf 2;
	echo "nvim [installed]"
	tput init;

	# does the same with clangd 
	FILE2="clangd-mac-14.0.3.zip"
	clangd --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading clangd..."
		curl -# -OL "https://github.com/clangd/clangd/releases/download/14.0.3/$FILE2"
		unzip -q $FILE2
		rm $FILE2
		mv clangd_* clangd_dir
		ln -s clangd_dir/bin/clangd clangd
	fi

	tput setaf 2;
	echo "clangd [installed]"
	tput init;

	# do the same with ripgrep
	FILE3="ripgrep-13.0.0-x86_64-apple-darwin.tar.gz"
	rg --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading ripgrep"
        pwd
		curl -# -OL "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz"
		tar xzf $FILE3
		rm $FILE3
		mv ripgrep-* rg_dir
		ln -s rg_dir/rg rg
	fi

	tput setaf 2;
	echo "ripgrep [installed]"
	tput init;

	# downloading fd
	FILE4="fd-v8.4.0-x86_64-apple-darwin.tar.gz"
	fd --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading fd"
        pwd
		curl -# -OL "https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-x86_64-apple-darwin.tar.gz" 
		tar xzf $FILE4
		rm $FILE4
		mv fd-* fd_dir
		ln -s fd_dir/fd fd
	fi

	tput setaf 2;
	echo "fd [installed]"
	tput init;

	# downloading lazygit
	FILE5="lazygit_0.41.0_Darwin_x86_64.tar.gz"
	lazygit --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading lazygit"
		curl -# -OL "https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Darwin_x86_64.tar.gz" 
		tar xzf $FILE5
		rm $FILE5
	fi

	tput setaf 2;
	echo "LazyGit [installed]"
	tput init;
else
	cd "$HOME/bin"
	FILE="nvim-linux64.tar.gz"
	nvim --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading nvim..."
        pwd
		curl -# -OL 'https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz'
		tar xzf nvim-linux64.tar.gz
		rm $FILE
		ln -s nvim-linux64/bin/nvim nvim
	fi
	tput setaf 2;
	echo "nvim [installed]"
	tput init;

	# does the same with clangd 
	FILE2="clangd-linux-14.0.3.zip"
	clangd --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading clangd..."
		curl -# -OL "https://github.com/clangd/clangd/releases/download/14.0.3/$FILE2"
		unzip -q $FILE2
		rm $FILE2
		mv clangd_* clangd_dir
		ln -s clangd_dir/bin/clangd clangd
	fi

	tput setaf 2;
	echo "clangd [installed]"
	tput init;

	# do the same with ripgrep
	FILE3="ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz"
	rg --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading ripgrep"
		curl -# -OL "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz"
		tar xzf $FILE3
		rm $FILE3
		mv ripgrep-* rg_dir
		ln -s rg_dir/rg rg
	fi

	tput setaf 2;
	echo "ripgrep [installed]"
	tput init;

	# downloading fd
	FILE4="fd-v9.0.0-x86_64-unknown-linux-gnu.tar.gz"
	fd --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading fd"
		curl -# -OL "https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-x86_64-unknown-linux-gnu.tar.gz" 
		tar xzf $FILE4
		rm $FILE4
		mv fd-* fd_dir
		ln -s fd_dir/fd fd
	fi

	tput setaf 2;
	echo "fd [installed]"
	tput init;

	# downloading lazygit
	FILE5="lazygit_0.41.0_Linux_x86_64.tar.gz"
	lazygit --version > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "downloading LazyGit"
		curl -# -OL "https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Linux_x86_64.tar.gz" 
		tar xzf $FILE5
		rm $FILE5
	fi

	tput setaf 2;
	echo "LazyGit [installed]"
	tput init;
fi

# add bin to PATH 
echo $PATH | grep -E ":$HOME/bin[ /]*:" > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "PATH+=':$HOME/bin'" >> "$HOME/.zshrc"
	export PATH+=':$HOME/bin'
fi
