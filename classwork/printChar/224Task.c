#include <stdio.h>
#include <unistd.h>


int main() {
	char ch = 0x00;
	
	write(1, "Type and hit enter:\n", 19);
	read(0, &ch, 1);
	printf("\nYou typed %c\n", ch);

	return(0);
}
