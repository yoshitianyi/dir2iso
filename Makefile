# omitting .PHONY
PKG_NAME := dir2iso
PKG_VERSION := 1.0.0
PKG_ITERATION := 1
PKG_FILE := $(PKG_NAME)_$(PKG_VERSION)-$(PKG_ITERATION)_amd64.deb
PKG_DIR := packagedir

$(PKG_FILE):
	PKG_NAME=$(PKG_NAME) \
	PKG_VERSION=$(PKG_VERSION) \
	PKG_ITERATION=$(PKG_ITERATION) \
	PKG_DESCRIPTION=$(PKG_DESCRIPTION) \
	PKG_DEPENDS=$(PKG_DEPENDS) \
	PKG_DIR=$(PKG_DIR) \
	bash make-deb.sh

install:
	dpkg -i $(PKG_FILE)

uninstall:
	dpkg -r $(PKG_NAME)

clean:
	rm -fr *.deb *.tmp $(PKG_DIR)
