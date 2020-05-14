#include <stdlib.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <immintrin.h>

//matrix multiplication using SSE and pthread library
//use transpose to get the column of second matrix as row

float array1[4][4] = {{1, 2, 3, 4},
			{5, 6, 7, 8},
			{9, 10, 11, 12},
			{13, 14, 15, 16}};
float array2[4][4] = {{16, 15, 14, 13},
			{12, 11, 10, 9},
			{8, 7, 6, 5},
			{4, 3, 2, 1}};
float arrayTranspose[4][4];
float displayArray[4][4];
float array4[16];	//1d 16 elements
float array5[16];	//1d 16 elements


void *multFunc(void *arg)
{
	//save transpose copy of array2 in arrayTranspose
	for(int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
			arrayTranspose[j][i] = array2[i][j];
	}

	//1d array for load error
	int s;
	for(int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			array4[s] = arrayTranspose[i][j];
			s++;
		}
	}

	//1d array for load error
	int e;
	for(int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			array5[e] = array1[i][j];
			e++;
		}
	}

	//multiplication and addition
	for (int i = 0; i < 4; i++)
	{
		//1f 1f 1f 1f = 32 x 4 = 128
		__m128 p = _mm_loadu_ps(&array5[i*4]);
		for (int j = 0; j < 4; j++)
		{
			__m128 q = _mm_loadu_ps(&array4[j*4]);
			__m128 y = _mm_mul_ps(p, q);
			float sum = ((float*)&y)[0] + ((float*)&y)[1] + ((float*)&y)[2] + ((float*)&y)[3];

			displayArray[i][j] = sum;
		}
	}
}

int main(void)
{
	//start thread
	pthread_t i;

	//calling multFunc
	pthread_create(&i, NULL, multFunc, NULL);

	//join thread
	pthread_join(i, NULL);

	//print displayArray
	//cols
	printf(" ");
	for (int x = 0; x < 4; x++)
	{
		//rows
		for (int y = 0; y < 4; y++)
		{
			//fix decimal precision
			printf("%f ", displayArray[x][y]);
		}
		//new line after each row
		printf("\n ");
	}

	return 0;
}
