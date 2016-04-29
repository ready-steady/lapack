package lapack

// #cgo LDFLAGS: -lgfortran -lm
// #include "lapack.h"
import "C"

import "unsafe"

func DGETRI(n int, a []float64, lda int, ipiv []int, work []float64, lwork int,
	info *int) {

	C.dgetri(C.int(n), (*C.double)(&a[0]), C.int(lda),
		(*C.int)(unsafe.Pointer(&ipiv[0])), (*C.double)(&work[0]), C.int(lwork),
		(*C.int)(unsafe.Pointer(info)))
}

func DGETRF(m, n int, a []float64, lda int, ipiv []int, info *int) {
	C.dgetrf(C.int(m), C.int(n), (*C.double)(&a[0]), C.int(lda),
		(*C.int)(unsafe.Pointer(&ipiv[0])), (*C.int)(unsafe.Pointer(info)))
}

func DGTSV(n, nrhs int, dl, d, du, b []float64, ldb int, info *int) {
	C.dgtsv(C.int(n), C.int(nrhs), (*C.double)(&dl[0]), (*C.double)(&d[0]),
		(*C.double)(&du[0]), (*C.double)(&b[0]), C.int(ldb),
		(*C.int)(unsafe.Pointer(info)))
}

func DSYEV(jobz, uplo byte, n int, a []float64, lda int, w, work []float64,
	lwork int, info *int) {

	C.dsyev(C.char(jobz), C.char(uplo), C.int(n), (*C.double)(&a[0]),
		C.int(lda), (*C.double)(&w[0]), (*C.double)(&work[0]), C.int(lwork),
		(*C.int)(unsafe.Pointer(info)))
}
