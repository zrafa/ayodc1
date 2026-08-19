
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define N 80000000

typedef struct {
	char	edad;
	double	peso;
	char	nro_dedos;
	double	altura;
	char 	hermanos;
	double	presion;
} Persona;

Persona base_de_datos[N];

void main (void)
{
	int i;

	base_de_datos[5].hermanos = 5;

	base_de_datos[8].presion = 5.674003999;

	for (i=0; i<N; i++)
		base_de_datos[i].presion = 5.674003999;

	sleep(20);

	printf("persona hermanos %i  peso %f \n", base_de_datos[i].hermanos, base_de_datos[i].peso);

}

