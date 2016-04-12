#ifndef LAPACK_H
#define LAPACK_H

extern void dgtsv_(const int *n, const int *nrhs, const double *dl, double *d,
	double *du, double *b, int *ldb, int *info);

extern void dsyev_(const char *jobz, const char *uplo, const int *n, double *a,
	const int *lda, double *w, double *work, const int *lwork, int *info);

void dgtsv(int n, int nrhs, double *dl, double *d, double *du, double *b,
	int ldb, int *info) {

	dgtsv_(&n, &nrhs, dl, d, du, b, &ldb, info);
}

void dsyev(char jobz, char uplo, int n, double *a, int lda, double *w,
	double *work, int lwork, int *info) {

	dsyev_(&jobz, &uplo, &n, a, &lda, w, work, &lwork, info);
}

#endif
