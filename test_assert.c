#include "codam_io.h"

int main()
{
	io_assert(2 == 2, "2 == 2");
	io_assert(2 != 2, "2 != %d", 2);
	return 0;
}
