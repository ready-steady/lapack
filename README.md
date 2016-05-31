# LAPACK [![Build Status][travis-img]][travis-url]

The package provides bindings to the [Basic Linear Algebra Subprograms][blas]
and [Linear Algebra Package][lapack].

The list of available routines currently includes:

* DDOT,
* DGEMM,
* DGEMV,
* DGETRF,
* DGETRI,
* DGTSV, and
* DSYEV.

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
make install
```

This command requires [gfortran][gfortran] to be installed.

## Contribution

1. Fork the project.
2. Implement your idea.
3. Open a pull request.

[blas]: http://www.netlib.org/blas/
[gfortran]: https://gcc.gnu.org/wiki/GFortranBinaries
[lapack]: http://www.netlib.org/lapack/

[doc]: http://godoc.org/github.com/ready-steady/lapack
[travis-img]: https://travis-ci.org/ready-steady/lapack.svg?branch=master
[travis-url]: https://travis-ci.org/ready-steady/lapack
