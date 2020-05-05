#include <stdio.h>
#include <immintrin.h>

//https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=AVX
// compile with -mavx for 256 intrin
int main(int argc, char** argv) {

	float r[8] = {0};
	float xx[8] = {1.2, 1.3, 1.4, 1.5, 2.1, 6.1, 7.2, 3.5};
	float yy[8] = {1.2, 1.3, 1.4, 1.5, 2.1, 6.1, 7.2, 3.5};

	//xmm0 128 bit
	//xmm0 1f 1f 1f 1f = 32 x 4 = 128
	__m256 x = _mm256_loadu_ps(xx);
	__m256 y = _mm256_loadu_ps(yy);

	//__m128 x = _mm_set_ps (1.2, 1.3, 1.4, 1.5);
	//__m128 y = _mm_set_ps (1.2, 1.3, 1.4, 1.5);
	__m256 z = _mm256_mul_ps (x, y);
	__m256 q = _mm256_hadd_ps (z, z);
	
	float sum = ((float*)&q)[0] + ((float*)&q)[1] + ((float*)&q)[4] + ((float*)&q)[5]; 
	 //	_mm256_storeu_ps (r, z);

	//for (int i =0;i<8;i++)
	printf("%f \n", sum);
	
	return 0;
}
