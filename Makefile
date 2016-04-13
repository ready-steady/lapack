root := $(shell pwd)
source := $(root)/source
target := $(root)/target

clibrary := libopenblas.a
glibrary := main.syso

all: $(glibrary)

install: $(glibrary)
	go install

$(glibrary): $(target)/opt/OpenBLAS/lib/$(clibrary)
	mkdir -p $(target)/objects
	cd $(target)/objects && ar x $<
	for letter in a b c d e f g h i j k l m n o p q r s t u v w x y z; do \
		if [ ! -z "$$(find $(target)/objects -name $$letter*.o)" ]; then \
			ld -r $(target)/objects/$$letter*.o -o $(target)/$$letter.syso; \
		fi; \
	done
	ld -r $(target)/*.syso -o $@

$(target)/opt/OpenBLAS/lib/$(clibrary): $(source)/Makefile
	$(MAKE) -C $(source) NO_CBLAS=1 netlib libs shared
	$(MAKE) -C $(source) "DESTDIR=$(target)" install

$(source)/Makefile:
	git submodule update --init

clean:
	rm -f $(glibrary)
	$(MAKE) -C $(source) clean
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
