package lapack

import (
	"testing"

	"github.com/ready-steady/assert"
)

func init() {
	SetNumberOfThreads(1)
}

func BenchmarkDGEMM(bench *testing.B) {
	m := 1000
	a, b, c := ones(m*m), ones(m*m), ones(m*m)

	for i := 0; i < bench.N; i++ {
		DGEMM('N', 'N', m, m, m, 1, a, m, b, m, 1, c, m)
	}
}

func BenchmarkDGEMVFewLarge(bench *testing.B) {
	m := 1000
	a, x, y := ones(m*m), ones(m*1), ones(m*1)

	for i := 0; i < bench.N; i++ {
		DGEMV('N', m, m, 1, a, m, x, 1, 1, y, 1)
	}
}

func BenchmarkDGEMVManySmall(bench *testing.B) {
	m := 20
	a, x, y := ones(m*m), ones(m*1), ones(m*1)

	for i := 0; i < bench.N; i++ {
		for j := 0; j < 20000; j++ {
			DGEMV('N', m, m, 1, a, m, x, 1, 1, y, 1)
		}
	}
}

func TestDDOT(t *testing.T) {
	n := 3

	dot := DDOT(n, []float64{1.0, 2.0, 3.0}, 1, []float64{3.0, 2.0, 1.0}, 1)

	assert.Equal(dot, 10.0, t)
}

func TestDGEMM(t *testing.T) {
	m, n, k := 2, 4, 3

	a := []float64{1, 4, 2, 5, 3, 6}
	b := []float64{1, 5, 9, 2, 6, 10, 3, 7, 11, 4, 8, 12}
	c := []float64{2, 7, 6, 2, 0, 7, 4, 2}

	DGEMM('N', 'N', m, n, k, 1, a, m, b, k, 1, c, m)

	assert.Equal(c, []float64{40, 90, 50, 100, 50, 120, 60, 130}, t)
}

func TestDGEMV(t *testing.T) {
	m, n := 2, 3

	a := []float64{1, 4, 2, 5, 3, 6}
	x := []float64{1, 2, 3}
	y := []float64{6, 8}

	DGEMV('N', m, n, 1, a, m, x, 1, 1, y, 1)

	assert.Equal(y, []float64{20, 40}, t)
}

func ones(size int) []float64 {
	data := make([]float64, size)
	for i := range data {
		data[i] = 1
	}
	return data
}
