#include "codam_io.h"

int main()
{
	int a;
	a = 2;
	io_assert(a == 2, "a == 2; got a = %d", a);
	a = 3;
	io_assert(a == 2, "a == 2; got a = %d", a);
	return 0;
}
