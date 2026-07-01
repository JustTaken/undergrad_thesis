#include <stdlib.h>
#include <stdio.h>
#include "variable.h"

int main() {
	real mult = 1000000;
	Variables variables = init_variables();
	printf("%f\n", variables.S[S_H_ion] * mult);

	solve(&variables, 0.001, 1);

	printf("%f\n", variables.S[S_H_ion] * mult);
	return 0;
}
