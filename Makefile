SHELL := /bin/bash

all: build install


.PHONY: clean clean-build clean-image build build-image compile install

clean-build:
	sudo rm build/*

clean-image:
	docker rmi mifix/i3-build:latest

clean: clean-build clean-image

build-image:
	docker build -t mifix/i3-build:latest .

compile:
	docker run --rm -it -v "$$PWD/build":/build mifix/i3-build:latest

build: build-image compile


DEBS = $(shell find build -type f -printf '%T@ %p\n' | sort -n | egrep "deb$$" | grep -v "dbg" | tail -2 | cut -f2- -d" " )
install:
	sudo dpkg -i $(DEBS)
