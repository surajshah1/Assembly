#include <stdio.h>
#include <stdint.h>

//rax 		//rdi
unsigned int absolute_value(int32_t k);
//void absolute_value_in_C(int32_t &i);

void absolute_value_in_C(int32_t *j)
{
	if (*j < 0)
		*j = *j * -1;
}
 
int main(int argc, char **argv)
{
	int32_t i = -1983;
	int32_t j = i;
	absolute_value_in_C(&j);
	uint32_t k = absolute_value(i);
	
	printf("The original value is: %d \n", i);
	printf("The absolute value in C is: %d \n", j);
	printf("THe absolute value in x86 Assembly is: %d \n", k);
	return 0;
}
