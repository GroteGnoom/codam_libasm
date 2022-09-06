#include <assert.h>
#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

void test_strlen(char *str) {
	assert(ft_strlen(str) == strlen(str));
}

void test_strcpy(char *str) {
	char buf[100] = "12345678910aaaaaaaaaaaa";
	char *ret = ft_strcpy(buf, str);
	assert (ret == buf);
	while (*ret) {
		assert(*ret = *str);
		ret++;
		str++;
	}
}

int sign(int a) {
	if (a < 0) {
		return -1;
	}
	if (a > 0) {
		return 1;
	}
	return 0;
}

void test_strcmp(char *s1, char *s2) {
	printf("%d\n", ft_strcmp(s1, s2));
	printf("%d\n", strcmp(s1, s2));
	assert(sign(ft_strcmp(s1, s2)) == sign(strcmp(s1, s2)));
}

void test_write(char *str) {
	//write(1, str, strlen(str));
	ft_write(1, str, strlen(str));
}

void test_read() {
	char buffer[1001];
	int fd = open("main.c", O_RDONLY);
	int n = ft_read(fd, buffer, 1000);
	buffer[n] = 0;
	ft_write(1, buffer, ft_strlen(buffer));
}

int main() {
	test_strlen("");
	test_strlen("banaan");
	test_strcpy("banaan");
	test_strcpy("");
	test_strcmp("", "");
	test_strcmp("", "bla");
	test_strcmp("bla", "");
	test_strcmp("bla", "ble");
	test_strcmp("ble", "bla");
	test_write("bla");
	test_write("");
	test_write("asdfasdf\n\nasdfasdf");
	test_read();
}
