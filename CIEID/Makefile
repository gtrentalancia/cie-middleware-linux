PREFIX := /usr
SHAREDIR := $(PREFIX)/share

all:
	cd src && $(MAKE) V=1

clean:
	cd src && $(MAKE) V=1 clean

install: all
	install -d $(SHAREDIR)/CIEID
	install -m 0755 CIEID.jar $(SHAREDIR)/CIEID/cieid.jar
	install -m 0644 logo_circle.png $(SHAREDIR)/CIEID
	install -m 0644 cieid.desktop $(SHAREDIR)/applications
