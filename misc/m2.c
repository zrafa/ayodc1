
#define N 20000
int a[N][N];


main() {


	int i,j;
	long unsigned int r;


	for (j=0; j<N; j++)
	for (i=0; i<N; i++)
		r = r + a[i][j];


	printf("Finalizó la sumatoria \n");
		



}
