#ifndef BLAS_H
#define BLAS_H

extern void dgemm_(const char *transa, const char *transb, const int *m,
	const int *n, const int *k, const double *alpha, const double *a,
	const int *lda, const double *b, const int *ldb, const double *beta,
	double *c, const int *ldc);

extern void dgemv_(const char *trans, const int *m, const int *n,
	const double *alpha, const double *a, const int *lda, const double *x,
	const int *incx, const double *beta, double *y, const int *incy);

void dgemm(char transa, char transb, int m, int n, int k, double alpha,
	const double *a, int lda, const double *b, int ldb, double beta, double *c,
	int ldc) {

	dgemm_(&transa, &transb, &m, &n, &k, &alpha, a, &lda, b, &ldb, &beta, c, &ldc);
}

void dgemv(char trans, int m, int n, double alpha, const double *a, int lda,
	const double *x, int incx, double beta, double *y, int incy) {

	dgemv_(&trans, &m, &n, &alpha, a, &lda, x, &incx, &beta, y, &incy);
}

#endif
