//Suraj Shah
//CS-118-02
//Professor Malik
//Date: 02/09/20

#include <stdio.h>
#include <stdlib.h>

int functionATOI(char *str)
{
	int sign = 1;
	int val = 0;
	int new;
	
	//skip if special character or space
	while (*str == ' ' || (*str >= 9 && *str <= 13))
		str++;
	//account for negative value
	if (*str == '-')
		sign = -1;
	//skip signs
	if (*str == '-' || *str == '+')
		str++;
	//convert string index to integer
	while (*str >= '0' && *str <= '9')
	{
		val = val * 10 + *str - '0';
		str++;
	}
	//multiply sign
	new = val*sign;
	return (new);
}

int main()
{
	printf("String to decimal number: %d\n", functionATOI("123456"));
	printf("Verify: %d\n", atoi("123456"));
	return (0);
}
