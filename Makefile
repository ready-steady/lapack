root := $(shell pwd)
source := $(root)/source
target := $(root)/target

clibrary := libopenblas.a
glibrary := main.syso

all: $(glibrary)

install: $(glibrary)
	go install

$(glibrary): $(target)/opt/OpenBLAS/lib/$(clibrary)
	mkdir -p $(target)/$@
	cd $(target)/$@ && ar x $<
	find $(target) -name *.o > $(target)/objects.txt
	ld -r -filelist $(target)/objects.txt -o $@

$(target)/opt/OpenBLAS/lib/$(clibrary): $(source)/Makefile
	$(MAKE) -C $(source) NO_CBLAS=1 netlib libs
	$(MAKE) -C $(source) DESTDIR=$(target) install

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(glibrary)
	$(MAKE) -C $(source) clean
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
