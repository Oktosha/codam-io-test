#include <unistd.h>
#include "codam_io.h"

int main()
{
	io_f_print(STDOUT_FILENO, "wrong %z", 32);
	return (0);
}
