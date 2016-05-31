package lapack

// #cgo LDFLAGS: -lgfortran -lm
// #include "openblas.h"
import "C"

// SetNumberOfThreads sets the number of threads used by OpenBLAS.
//
// If your application is already multi-threaded, it will conflict with OpenBLAS
// multi-threading. Thus, you must set OpenBLAS to use only one thread.
//
// https://github.com/xianyi/OpenBLAS/wiki/faq#multi-threaded
func SetNumberOfThreads(n uint) {
	C.openblas_set_num_threads(C.int(n))
}
