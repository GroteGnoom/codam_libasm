#include <assert.h>
#include "libasm.h"
int main() {
	assert(ft_strlen("") == 0);
	assert(ft_strlen("banaan") == 6);
	assert(ft_strlen("banaan\n\n") == 8);
}
