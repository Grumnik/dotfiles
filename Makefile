all:
	@echo "no argument passed do 'make help' for examples"

help:
	@echo "possible arguments: config_i3," 

config_i3:
	@echo "This wil override your current i3 config, do you want to continue?" && read ans && [ $$ans = y ]
	cp -r ./i3 ~/.config

