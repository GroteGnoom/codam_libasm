#include <assert.h>
#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

void test_strlen(char *str) {
	assert(ft_strlen(str) == strlen(str));
}

void test_strcpy(char *str) {
	char buf[100] = "12345678910aaaaaaaaaaaa";
	char *ret = ft_strcpy(buf, str);
	assert (ret == buf);
	while (*ret) {
		assert(*ret == *str);
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
	//printf("%d\n", ft_strcmp(s1, s2));
	//printf("%d\n", strcmp(s1, s2));
	assert(sign(ft_strcmp(s1, s2)) == sign(strcmp(s1, s2)));
}

void test_write(char *str) {
	int fd1 = open("test1", O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
	int fd2 = open("test2", O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
	printf("%d %d\n", fd1, fd2);
	ssize_t a = write(fd1, str, strlen(str));
	ssize_t b = ft_write(fd2, str, strlen(str));
	close(fd1);
	close(fd2);
	printf("%ld %ld\n", a, b);
	assert(a==b);
	fd1 = open("test1", O_RDONLY);
	fd2 = open("test2", O_RDONLY);
	char buffer1[10001];
	char buffer2[10001];
	int n1 = read(fd1, buffer1, 10000);
	int n2 = read(fd2, buffer2, 10000);
	buffer1[n1] = 0;
	buffer2[n2] = 0;
	assert(!strcmp(buffer1, buffer2));
}

void test_read() {
	char buffer1[10001];
	char buffer2[10001];
	int fd = open("main.c", O_RDONLY);
	int n = ft_read(fd, buffer1, 10000);
	close(fd);
	fd = open("main.c", O_RDONLY);
	int n2 = read(fd, buffer2, 10000);
	buffer1[n] = 0;
	buffer2[n2] = 0;
	assert(!strcmp(buffer1, buffer2));
}

void test_strdup(char *str) {
	char *dup = ft_strdup(str);
	assert(!ft_strcmp(dup, str));
	//printf("%s\n", dup);
	free(dup);
}

int main() {
	setbuf(stdout, NULL);
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
	test_strdup("");
	test_strdup("bla");
	test_strdup("asdfasdf\n\nasdfasdf");
}
