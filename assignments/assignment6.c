#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

void mymemcpy (void *p2, void* p1, unsigned int);
 
int main ()
{
        const uint32_t MEM_SIZE_100MB  = ( 100 * 1024 * 1024 );
        char *p1 = (char*)0xDEADBEEF;
        char *p2;

        p1 = malloc(MEM_SIZE_100MB * sizeof(char));
        p2 = malloc(MEM_SIZE_100MB * sizeof(char));

        int i = 10;

        clock_t t;
        t = clock();
        while (i != 0)
        {
                memcpy (p2, p1, MEM_SIZE_100MB);
                i--;
        }
        t = clock() - t;
        double time_taken = ((double)t)/CLOCKS_PER_SEC; // in seconds 
        printf("c took %f seconds to execute \n", time_taken);

	int j = 10;

	clock_t t2;
        t2 = clock();
        while (j != 0)
        {
                mymemcpy (p2, p1, MEM_SIZE_100MB);
                j--;
        }
        t2 = clock() - t2;
        double time_taken2 = ((double)t2)/CLOCKS_PER_SEC; // in seconds 
        printf("asm took %f seconds to execute \n", time_taken2);

        return 0;
}
      
