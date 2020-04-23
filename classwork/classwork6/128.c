#include <stdio.h>
#include <nmmintrin.h>

int main(int argc, char** argv) {


	float r[8] = {0};
	float xx[8] = {1.2, 1.3, 1.4, 1.5, 2.1, 6.1, 7.2, 3.5};
	float yy[8] = {1.2, 1.3, 1.4, 1.5, 2.1, 6.1, 7.2, 3.5};

	//xmm0 128 bit
	//xmm0 1f 1f 1f 1f = 32 x 4 = 128
	__m128 x = _mm_load_ps(xx);
	__m128 y = _mm_load_ps(yy);
	//do again for the next 4 elements = 32, 32, 32, 32 = 128
	__m128 p = _mm_load_ps(&xx[4]);
	__m128 q = _mm_load_ps(&yy[4]);

	//__m128 x = _mm_set_ps (1.2, 1.3, 1.4, 1.5);
	//__m128 y = _mm_set_ps (1.2, 1.3, 1.4, 1.5);
	__m128 z = _mm_mul_ps (x, y);
	__m128 s = _mm_mul_ps (p, q);

	_mm_storeu_ps (r, z);
	_mm_storeu_ps (&r[4], s);
 	
	/*
	//global vars
	int j = 2
	while (j != 0)
	{
		i = 0

		__m128 x = _mm_load_ps(&xx[i]);
		__m128 z = _mm_mul_ps (x, x);
		_mm_storeu_ps (&r[i], z) 
		
		i += 4;
		j--;
	}
	*/
	
	for (int i =0;i<8;i++)
		printf("%f \n", r[i]);

	return 0;

}
