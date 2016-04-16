.PHONY: doc release

VERSION = $(shell . bb.bash && echo $${BB_VERSION})

doc: README.md
	pod2markdown bb.bash > README.md

release:
	git add .
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
