root := $(shell pwd)
source := $(root)/source

ifeq ($(shell uname -s),Darwin)
extension := dylib
else
extension := so
endif

clibrary := libopenblas.$(extension)
glibrary := main.syso

all: $(glibrary)

install: $(glibrary)
	go install

$(glibrary): $(source)/$(clibrary)
	cp $< $@

$(source)/$(clibrary): $(source)/Makefile
	$(MAKE) -C $(source) NO_CBLAS=1 netlib libs shared &> /dev/null

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(glibrary)
	$(MAKE) -C $(source) clean &> /dev/null
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
