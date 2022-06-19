ifeq (${XDG_DATA_HOME},"")
	XDG_DATA_HOME="$$HOME/.config"
endif
SHELL_INIT="$$HOME/.bashrc"

all:
	@echo "no argument passed do 'make help' for examples"

show_vars:
	@echo "SHELL_INIT: ${SHELL_INIT}"
	@echo "XDG_DATA_HOME: ${XDG_DATA_HOME}"

question:
	@echo "This wil override your current config, do you want to continue?" && read ans && [ $$ans = y ]

config_i3: question
	cp -r ./i3 ${XDG_DATA_HOME}

config_nvim: question
	# cp dir, install vim-plug, install plugins
	cp -r ./nvim ~/.config
	curl -fLo ${XDG_DATA_HOME}/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -es -u ${XDG_DATA-HOME}/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"

install_scripts:
	cp -r ./scripts ~/
	grep -qxF 'PATH=$$PATH:$$HOME/scripts' ${SHELL_INIT} || echo 'PATH=$$PATH:$$HOME/scripts' >> ${SHELL_INIT}

install_bash_aliases: question
	cp ./bash_aliases ~/.bash_aliases

