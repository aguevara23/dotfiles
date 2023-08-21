if [ "$CODESPACES" == "true" ]; then
    echo "Running in codespaces. Installing dotfiles"

    if ! command -v fzf --version &> /dev/null
    then
        echo "Installing fzf"
        brew install fzf
    fi

    if ! command -v nvim --version &> /dev/null
    then
        echo "Installing nvim"
        brew install nvim
    fi

    if ! command -v rg --version &> /dev/null
    then
        echo "Installing ripgrep"
        brew install ripgrep
    fi

    if ! command -v tmux &> /dev/null
    then
        echo "Installing tmux"
        brew install tmux
    fi

    if ! command -v fd --version &> /dev/null
    then
        echo "Installing fd"
        brew install fd
    fi

    ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
    ln -s "$(pwd)/nvim" "$HOME/.config/nvim"

else
    echo "Not running in codespaces"
fi
