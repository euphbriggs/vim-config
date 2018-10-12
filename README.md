# README

This file is intended to help in setting up a new Linux development environment for Elixir and Elm development.

# Setup Environment

## Ubuntu/Debian

1. Ensure the required directories are present
  * `~/.vim/bundle`
  * `~/Sandbox`
  * `~/.bin`
1. Install `exuberant-ctags`
  * `sudo apt-get install exuberant-ctags`
1. Install Elixir
  * `wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb`
  * `sudo apt-get update`
  * `sudo apt-get install esl-erlang`
  * `sudo apt-get install elixir`
1. Install NodeJS
  * `curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -`
  * `sudo apt-get install nodejs`
1. Install Elm
  * `sudo npm install --unsafe-perm=true --allow-root -g elm@0.18.0`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-format`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-oracle`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-test`
1. Clone Elixir Language Server
  * `cd ~/Sandbox`
  * `git clone https://github.com/JakeBecker/elixir-ls.git`
  * `cd elixir-ls`
  * `mix deps.get`
  * `mix compile`
  * `mix elixir_ls.release -o lsp`
1. Clone the Vundle repo
  * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

# Vim

.vimrc is the vim configuration file.

1. Copy .vimrc from this repository into your home directory
1. Open vim
  * Its ok to ignore any warnings at this point, we haven't installed the plugins yet
1. Type `:PluginInstall`
  * Vundle will download and install the plugins listed in the .vimrc file
1. Type `:qa` to exit vim

## Optional

1. Copy the `codedark.vim` file to `~/.vim/bundle/vim-code-dark/colors/`
1. Copy the `elm.vim` file to `~/.vim/bundle/elm-vim/autoload/` to resolve `elm-format` warning about unknown Elm version
1. Copy the `elmtags.py` file to `~/.bin`
1. Copy the `.ctags` file to `~`
