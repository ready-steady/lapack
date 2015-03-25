# LAPACK [![Build Status][travis-img]][travis-url]

The package provides bindings to the [Basic Linear Algebra Subprograms][blas]
(BLAS) and [Linear Algebra PACKage][lapack] (LAPACK).

The list of available routines currently includes:

* [DGEMM](http://www.netlib.org/lapack/explore-html/dc/da8/dgemm_8f.html),
* [DGEMV](http://www.netlib.org/lapack/explore-html/dc/da8/dgemv_8f.html),
* [DGTSV](http://www.netlib.org/lapack/explore-html/d1/db3/dgtsv_8f.html), and
* [DSYEV](http://www.netlib.org/lapack/explore-html/dd/d4c/dsyev_8f.html).

## [Documentation][doc]

## Installation

Fetch the package:

```bash
go get -d github.com/ready-steady/lapack
```

Go to the directory of the package:

```bash
cd $GOPATH/src/github.com/ready-steady/lapack
```

Finally, install the package:

```bash
git submodule update --init
make install
```

This command requires [gfortran][gfortran] to be installed.

[blas]: http://www.netlib.org/blas/
[gfortran]: https://gcc.gnu.org/wiki/GFortranBinaries
[lapack]: http://www.netlib.org/lapack/

[doc]: http://godoc.org/github.com/ready-steady/lapack
[travis-img]: https://travis-ci.org/ready-steady/lapack.svg?branch=master
[travis-url]: https://travis-ci.org/ready-steady/lapack
