ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SHELL := /bin/bash


install: vim git bash task scripts

vim: vimlinks
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -c PlugInstall -c quitall

vimlinks:
	rm -rf ~/.vim
	mkdir $(HOME)/.vim
	mkdir $(HOME)/.vim/functions
	mkdir $(HOME)/.vim/ftplugin
	ln -sf $(ROOT_DIR)/vimfiles/*.vim $(HOME)/.vim/functions
	ln -sf $(ROOT_DIR)/vimfiles/vimrc $(HOME)/.vimrc
	ln -sf $(ROOT_DIR)/vimfiles/ftplugin $(HOME)/.vim/ftplugin

git:
	ln -sf $(ROOT_DIR)/gitfiles/gitconfig $(HOME)/.gitconfig
	ln -sf $(ROOT_DIR)/gitfiles/gitignore $(HOME)/.gitignore

bash:
	ln -sf $(ROOT_DIR)/bashrc $(HOME)/.bashrc

task:
	sudo apt-get install task
	ln -sf $(ROOT_DIR)/taskrc $(HOME)/.taskrc

scripts:
	ln -sf $(ROOT_DIR)/bin $(HOME)/.scripts
	
clean:
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.gitconfig
	rm -rf $(HOME)/.gitignore
	rm -rf $(HOME)/.bashrc
