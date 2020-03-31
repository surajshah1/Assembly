#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

int main ()
{
	const uint32_t MEM_SIZE_100MB  = ( 100 * 1024 * 1024 );
	char *p1 = (char*)0xDEADBEEF;
	char *p2;

	p1 = malloc(MEM_SIZE_100MB * sizeof(char));
	p2 = malloc(MEM_SIZE_100MB * sizeof(char)); 

	//moving 5gb of data in 0.26 seconds!	
	int i = 50;	

	clock_t t; 
    	t = clock(); 
	while (i != 0)
	{	
		memcpy (p2, p1, MEM_SIZE_100MB); 
  		i--;
	}
	t = clock() - t;
	double time_taken = ((double)t)/CLOCKS_PER_SEC; // in seconds 
	printf("memcpy took %f seconds to execute \n", time_taken);

	return 0;
}
