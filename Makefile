root := $(shell pwd)
source := $(root)/source
target := $(root)/target
object := main.syso

all: $(object)

install: $(object)
	go install

$(object): $(source)/librefblas.a $(source)/liblapack.a
	mkdir -p $(target)/$@
	cd $(target)/$@ && ar x $(source)/librefblas.a
	cd $(target)/$@ && ar x $(source)/liblapack.a
	ld -r -o $@ $(target)/$@/*.o

$(source)/librefblas.a: $(source)/make.inc
	$(MAKE) -C $(source) blaslib

$(source)/liblapack.a: $(source)/make.inc
	$(MAKE) -C $(source) lapacklib

$(source)/make.inc: $(source)/make.inc.example
	cp $(source)/make.inc.example $@

$(source)/make.inc.example:
	git submodule update --init

clean:
	rm -rf $(object) $(target)
	cd $(source) && (git checkout . && git clean -df)

.PHONY: all install clean
