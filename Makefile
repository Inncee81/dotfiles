.PHONY: test brew shell symlink

test:
	rake spec

brew:
	brew bundle --global

shell:
	./init/shell.sh

symlink:
	./init/symlink.sh
