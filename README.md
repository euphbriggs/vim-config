# README

This file is intended to help in setting up a new Linux development environment for Elixir and Elm development.

# Setup Environment

## Ubuntu/Debian

* Ensure the required directories are present
  * `~/.vim/bundle`
  * `~/Sandbox`
  * `~/.bin`
* Install `exuberant-ctags`
  * `sudo apt-get install exuberant-ctags`
* Install Elixir
  * `wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb`
  * `sudo apt-get update`
  * `sudo apt-get install esl-erlang`
  * `sudo apt-get install elixir`
* Install NodeJS
  * `curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -`
  * `sudo apt-get install nodejs`
* Install Elm
  * `sudo npm install --unsafe-perm=true --allow-root -g elm@0.18.0`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-format`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-oracle`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-test`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-live`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-oracle`
  * `sudo npm install --unsafe-perm=true --allow-root -g elm-css`
* Clone Elixir Language Server
  * `cd ~/Sandbox`
  * `git clone https://github.com/JakeBecker/elixir-ls.git`
  * `cd elixir-ls`
  * `mix deps.get`
  * `mix compile`
  * `mix elixir_ls.release -o lsp`
* Clone the Vundle repo
  * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

# Vim

.vimrc is the vim configuration file.

* Copy .vimrc from this repository into your home directory
* Open vim
  * Its ok to ignore any warnings at this point, we haven't installed the plugins yet
* Type `:PluginInstall`
  * Vundle will download and install the plugins listed in the .vimrc file
* Type `:qa` to exit vim

## Optional

* Copy the `codedark.vim` file to `~/.vim/bundle/vim-code-dark/colors/`
* Copy the `elm.vim` file to `~/.vim/bundle/elm-vim/autoload/` to resolve `elm-format` warning about unknown Elm version
* Copy the `elmtags.py` file to `~/.bin`
* Copy the `.ctags` file to `~`
