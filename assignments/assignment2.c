//Suraj Shah
//CS-118-02
//Professor Malik
//Date: 02/10/20

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main(int ac, char **av)
{
	if (ac == 2)
	{
		//input value
		int32_t number = atoi(av[1]);
		//absolute value
		uint32_t x = abs(number);	
		//one's complement
		x = ~number;
		//two's complement
		x = number++;
		//print number in hex
		printf("The number in hex is: %x\n", x);	
	}
	else
		printf("%s\n", "Only one number required from input");
	return (0);
}
