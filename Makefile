root := $(shell pwd)
source := $(root)/source

ifeq ($(shell uname -s),Darwin)
extension := dylib
else
extension := so
endif

target := main.syso
library := libopenblas.$(extension)

all: $(target)

install: $(target)
	go install

$(target): $(source)/$(library)
	cp $< $@

$(source)/$(library): $(source)/Makefile
	$(MAKE) -C $(source) netlib libs shared

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(target)
	$(MAKE) -C $(source) clean
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
