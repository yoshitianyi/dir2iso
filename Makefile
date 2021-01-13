# omitting .PHONY
PKG_NAME := dir2iso
PKG_VERSION := 1.0.0
PKG_ITERATION := 1
PKG_FILE := $(PKG_NAME)_$(PKG_VERSION)-$(PKG_ITERATION)_all.deb
PKG_DESCRIPTION := "Directory to ISO"
PKG_DEPENDS := "genisoimage"

$(PKG_FILE):
	PKG_NAME=$(PKG_NAME) \
	PKG_VERSION=$(PKG_VERSION) \
	PKG_ITERATION=$(PKG_ITERATION) \
	PKG_DESCRIPTION=$(PKG_DESCRIPTION) \
	PKG_DEPENDS=$(PKG_DEPENDS) \
	bash make-deb.sh

install:
	dpkg -i $(PKG_FILE)

uninstall:
	dpkg -r $(PKG_NAME)

clean:
	rm -fr $(PKG_FILE) workdir
