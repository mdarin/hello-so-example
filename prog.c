#include <stdio.h>
#include <stdlib.h>
#include <math.h> 

// move to headers
void ctest1(int *);
void ctest2(int *);
double ctest3(double , double );
double ctest4(double, double); 

// usage
int main(void)
{
	int x = 0;
	ctest1(&x);
	printf("ctest1() -> %d\n", x);
	ctest2(&x);
	printf("ctest2() -> %d\n", x);
	double power = ctest3(2.0, 2.0);
	printf("ctest3() -> %f\n", power);
	power = ctest4(3.0, 3.0);
	printf("ctest4() -> %f\n", power);
	return 0;
}


double ctest3(double first, double second)
{
	/* Use function pow() from libm - this will cause a linkage
     	* error unless this code is compiled against libm! */
   	double power = pow(first, second);
	return power;
}

