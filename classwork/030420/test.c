#include <stdio.h>

int foo(int, int, int, int);

int main()
{
	// 10 is held in rdi, 20 rsi, 30 rdx, 10 rcx
	int x = foo(10, 20, 30, 10);
	printf("result %d\n", x);
}
