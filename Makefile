root := $(shell pwd)
source := $(root)/source
target := $(root)/target

clibrary := libopenblas.a
glibrary := main.syso

letters := b c d g i l m o p q s x z

all: $(glibrary)

install: $(glibrary)
	go install

$(glibrary): $(target)/opt/OpenBLAS/lib/$(clibrary)
	mkdir -p $(target)/$@
	cd $(target)/$@ && ar x $<
	for letter in $(letters); do \
		ld -r $(target)/$@/$$letter*.o -o $(target)/$$letter.syso; \
	done
	ld -r $(patsubst %,$(target)/%.syso,$(letters)) -o $@

$(target)/opt/OpenBLAS/lib/$(clibrary): $(source)/Makefile
	$(MAKE) -C $(source) NO_CBLAS=1 netlib libs shared
	$(MAKE) -C $(source) DESTDIR=$(target) install

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(glibrary)
	$(MAKE) -C $(source) clean
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
