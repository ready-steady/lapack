build := lapack
syso := main.syso

all: $(syso)

install: $(syso)
	go install

$(syso): $(build)/librefblas.a $(build)/liblapack.a
	mkdir -p $(build)/$@
	cd $(build)/$@ && ar x ../librefblas.a
	cd $(build)/$@ && ar x ../liblapack.a
	ld -r -o $@ $(build)/$@/*.o

$(build)/librefblas.a: $(build)/make.inc
	$(MAKE) -C $(build) blaslib

$(build)/liblapack.a: $(build)/make.inc
	$(MAKE) -C $(build) lapacklib

$(build)/make.inc: $(build)/make.inc.example
	cp $(build)/make.inc.example $@

$(build)/make.inc.example:
	git submodule update --init

clean:
	rm -rf $(syso)
	cd $(build) && (git checkout . && git clean -df)

.PHONY: all install clean
