package lapack

// #cgo LDFLAGS: -lgfortran -lm
// #include "blas.h"
import "C"

func DDOT(n int, x []float64, incx int, y []float64, incy int) float64 {
	return float64(C.ddot(C.int(n), (*C.double)(&x[0]), C.int(incx),
		(*C.double)(&y[0]), C.int(incy)))
}

func DGEMM(transa, transb byte, m, n, k int, alpha float64, a []float64,
	lda int, b []float64, ldb int, beta float64, C []float64, ldc int) {

	C.dgemm(C.char(transa), C.char(transb), C.int(m), C.int(n), C.int(k),
		C.double(alpha), (*C.double)(&a[0]), C.int(lda), (*C.double)(&b[0]),
		C.int(ldb), C.double(beta), (*C.double)(&C[0]), C.int(ldc))
}

func DGEMV(trans byte, m, n int, alpha float64, a []float64, lda int,
	x []float64, incx int, beta float64, y []float64, incy int) {

	C.dgemv(C.char(trans), C.int(m), C.int(n), C.double(alpha),
		(*C.double)(&a[0]), C.int(lda), (*C.double)(&x[0]), C.int(incx),
		C.double(beta), (*C.double)(&y[0]), C.int(incy))
}
