all: freeze-extensions
install: install-extension

freeze-extensions:
	code --list-extensions > extensions.txt

install-extensions:
	cat extensions.txt | xargs -L 1 code --install-extension

.PHONY: all install freeze-extensions install-extension
