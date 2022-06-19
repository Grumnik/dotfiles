#.PHONY: ask

all:
	@echo "no argument passed do 'make help' for examples"

help:
	@echo "possible arguments: config_i3, config_nvim" 

question:
	@echo "This wil override your current config, do you want to continue?" && read ans && [ $$ans = y ]

config_i3: question
	cp -r ./i3 ~/.config

config_nvim: question
	# cp dir, install vim-plug, install plugins
	cp -r ./nvim ~/.config
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"


