#include <stdio.h>

#define N 3000
#define M 500000
int a[N][M];


int main() {

	long int i,j,k;
	long unsigned int r;


		for (j=0; j<M; j++)
		for (i=0; i<N; i++) {
			r = r + a[i][j];
		}


	printf("Finalizó la sumatoria \n");
}
