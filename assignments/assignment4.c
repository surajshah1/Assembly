//Suraj Shah
//CS-118-02
//Professor Malik
//Date: 02/24/20

#include <stdio.h>
#include <stdint.h>

void printSign(float num)
{
	uint32_t *q = (uint32_t *)&num;
	
	*q = *q >> 31;
	printf("sign in decimal: %d\n", *q);
	printf("sign in hex: %x\n", *q);
}

void printExponent(float num)
{
	uint32_t *q = (uint32_t *)&num;
	
	*q = *q << 1;
	*q = *q >> 24;
	printf("exponent in decimal: %d\n", *q);
	printf("exponent in hex: %x\n", *q);
}

void printMantissa(float num)
{
        uint32_t *q = (uint32_t *)&num;

        *q = *q << 9;
	*q = *q >> 9;
        printf("mantissa in decimal: %d\n", *q);
        printf("mantissa in hex: %x\n", *q);
}

int main()
{
	float num = -7.75;

	printSign(num);
	printExponent(num);
	printMantissa(num);	
	return(0);
}
