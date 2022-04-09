PREFIX := /usr
SHAREDIR := $(PREFIX)/share

JAVAC = javac -Xlint:unchecked
sources = $(shell find . -type f -name '*.java')
classes = $(sources:.java=.class)

all: extractjars jar

jar: compile
	./create-jar-script.sh

compile: $(classes)

extractjars: extracted-jars

extracted-jars:
	./extract-jars.sh

install: all
	install -d $(SHAREDIR)/CIEID
	install -m 0755 ../CIEID.jar $(SHAREDIR)/CIEID/cieid.jar
	install -m 0644 ../logo_circle.png $(SHAREDIR)/CIEID
	install -m 0644 ../cieid.desktop $(SHAREDIR)/applications

clean:
	rm -f extracted-jars $(classes) ../CIEID.jar

%.class: %.java
	$(JAVAC) $<
