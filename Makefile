PKG_NAME := dir2iso
PKG_VERSION := 1.0.0
PKG_ITERATION := 1
PKG_FILE := $(PKG_NAME)_$(PKG_VERSION)-$(PKG_ITERATION)_all.deb

$(PKG_FILE):
	PKG_NAME=$(PKG_NAME) \
	PKG_VERSION=$(PKG_VERSION) \
	PKG_ITERATION=$(PKG_ITERATION) \
	bash make.sh

install:
	dpkg -i $(PKG_FILE)

uninstall:
	dpkg -r $(PKG_NAME)

clean:
	rm -fr $(PKG_FILE) workdir
