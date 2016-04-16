.PHONY: doc release

VERSION = $(shell bb --version)

doc: README.md
	pod2markdown bb > README.md

release: doc
	git add .
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
