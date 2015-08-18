#!/bin/bash

set -e

install_script_dir=$(dirname $(readlink -f "$0"))

plugins="
  https://github.com/vim-scripts/cscope.vim.git
  https://github.com/wincent/Command-T.git
  https://github.com/terryma/vim-multiple-cursors.git
  https://github.com/valloric/YouCompleteMe.git
"

bundle_dir="$HOME/.vim/bundle"
mkdir -p "$bundle_dir"

# Install Pathogen
mkdir -p ~/.vim/autoload && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone plugins
for p in $plugins; do
  cd "$bundle_dir"
  dir_name=$(basename "$p" | sed 's/\.git$//')
  if [ ! -d "$dir_name" ]; then
    git clone "$p"
  else
    cd "$dir_name"
    git pull
  fi
done

# Install YouCompleteMe
cd "$bundle_dir/YouCompleteMe"
git submodule update --init --recursive
./install.sh --clang-completer

# Install Cscope
cd "$bundle_dir/cscope.vim"
git apply "$install_script_dir/cscope.vim.patch" || true

# Install Command-T
cd "$bundle_dir/Command-T/ruby/command-t"
ruby extconf.rb
make

function install_file() {
  source_file="$1"
  target_file="$2"
  if [ ! -f "$target_file" ]; then
    mkdir -p $(dirname "$target_file")
    ln -s "$source_file" "$target_file"
  elif ! (ls -l "$target_file" | grep "$source_file"); then
    echo "Error: $target_file exists and isn't symlink to $source_file"
    exit 1
  fi
}

install_file "$install_script_dir/vimrc" "$HOME/.vimrc"
install_file "$install_script_dir/nilezell.vim" "$HOME/.vim/colors/nilezell.vim"
