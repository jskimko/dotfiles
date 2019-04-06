#/usr/bin/env sh
trap 'echo && exit' SIGINT

command -v git >/dev/null || { echo 'error: need git' >&2; exit; }

start=$(pwd)

if [ ! $(basename $start) = dotfiles ]; then
    echo "error: run from 'dotfiles' repo" >&2
    exit
fi

echo -ne '\e[96;1m> Install dotfiles? (y/n) \e[39;0m'
read user
if [ "_$user" = _y ]; then
    cat vimrc >> $HOME/.vimrc
    cat bashrc >> $HOME/.bashrc
    cat tmux.conf >> $HOME/.tmux.conf
fi

echo -ne '\e[96;1m> Install vim plugins? (y/n) \e[39;0m'
read user
if [ "_$user" = _y ]; then
    mkdir -p $HOME/.vim/undo $HOME/.vim/bundle
    cd $HOME/.vim

    # pathogen
    git clone https://github.com/tpope/vim-pathogen
    mv vim-pathogen/autoload .
    rm -rf vim-pathogen

    # plugins
    cd bundle
    git clone https://github.com/vim-scripts/AutoComplPop
    git clone https://github.com/junegunn/fzf.vim
    git clone https://github.com/pbogut/fzf-mru.vim
    git clone https://github.com/justinmk/vim-sneak
    git clone https://github.com/tpope/vim-surround
    git clone https://github.com/majutsushi/tagbar

    cd $start
fi

echo -ne '\e[96;1m> Install rust things? (y/n) \e[39;0m'
read user
if [ "_$user" = _y ]; then 
    # rust
    curl https://sh.rustup.rs -sSf | sh

    # utils
    if command -v cargo; then 
        # ripgrep
        git clone https://github.com/BurntSushi/ripgrep
        cd ripgrep
        cargo build --release
        cargo install
        cd $start
        
        # fd
        git clone https://github.com/sharkdp/fd
        cd fd
        cargo build --release
        cargo install
        cd $start
    else
        echo "error: failed to install rust" >&2
    fi
fi
