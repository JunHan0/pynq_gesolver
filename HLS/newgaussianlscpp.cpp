#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>

#define MAX_SIZE 40
#define DATA_WIDTH 32

typedef float float_point_t;
typedef ap_axiu<DATA_WIDTH, 1, 1, 1> stream_t;

void gaussian_elimination(int n, float_point_t A[MAX_SIZE][MAX_SIZE], float_point_t B[MAX_SIZE], float_point_t X[MAX_SIZE]) {
    float_point_t temp;

    // Gaussian elimination
    for(int k=0; k<n; k++) {
        for(int i=k+1; i<n; i++) {
            temp = A[i][k] / A[k][k];
            for(int j=k; j<n; j++) {
                A[i][j] -= temp * A[k][j];
            }
            B[i] -= temp * B[k];
        }
    }

    // Back substitution
    for(int i=n-1; i>=0; i--) {
        for(int j=i+1; j<n; j++) {
            B[i] -= A[i][j] * X[j];
        }
        X[i] = B[i] / A[i][i];
    }
}

extern "C" {
void solve_linear_equations(int n, float_point_t *A, float_point_t *B, float_point_t *X) {
    #pragma HLS INTERFACE m_axi port=A offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=B offset=slave bundle=gmem1
    #pragma HLS INTERFACE m_axi port=X offset=slave bundle=gmem2
    #pragma HLS INTERFACE s_axilite port=A bundle=control
    #pragma HLS INTERFACE s_axilite port=B bundle=control
    #pragma HLS INTERFACE s_axilite port=X bundle=control
    #pragma HLS INTERFACE s_axilite port=n bundle=control
    #pragma HLS INTERFACE s_axilite port=return bundle=control

    float_point_t A_local[MAX_SIZE][MAX_SIZE];
    float_point_t B_local[MAX_SIZE];
    float_point_t X_local[MAX_SIZE];

    // Transfer data from global memory to local arrays
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            A_local[i][j] = A[i*n+j];
        }
        B_local[i] = B[i];
    }

    // Perform the computation
    gaussian_elimination(n, A_local, B_local, X_local);

    // Write results back to global memory
    for(int i=0; i<n; i++) {
        X[i] = X_local[i];
    }
}
}



