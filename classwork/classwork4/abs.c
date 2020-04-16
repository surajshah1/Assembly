#include <stdio.h>
#include <stdint.h>

//rax 		//rdi
unsigned int absolute_value(int32_t k);
 
int main(int argc, char **argv)
{
	
	int32_t i = -1983;
	int32_t j = i;
	uint32_t k = absolute_value(i);
	
	if (j < 0)
		j = j * -1;
	
	printf("The absolute value in C is: %d \n", j);
	printf("THe absolute value in x86 Assembly is: %d \n", k);
	return 0;
}
