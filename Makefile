root := $(shell pwd)
source := $(root)/source

ifeq ($(shell uname -s),Darwin)
extension := dylib
else
extension := so
endif

into := main.syso
from := libopenblas.$(extension)

all: $(into)

install: $(into)
	go install

$(into): $(source)/$(from)
	cp $< $@

$(source)/$(from): $(source)/Makefile
	$(MAKE) -C $(source) netlib libs shared

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(into)
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
