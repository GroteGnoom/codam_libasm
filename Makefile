NAME = libasm.a
SRC = ft_strlen.s
TEST = main.c
INC = libasm.h

ifdef DEBUG
	CC=clang++
	ASAN_OPTIONS='detect_leaks=1'
	CFLAGS = -Wall -Wextra -fsanitize=address -DDEBUG=1 -g -std=c++98 -pedantic -Wshadow
else
	CC=gcc
	CFLAGS = -Wall -Wextra -Werror
endif

AFLAGS = -fmacho64

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar r $@ $(OBJ)

%.o: %.s $(INC)
	nasm $(AFLAGS) $<

main.o: main.c
	$(CC) $(CFLAGS) main.c -c -o main.o

test: $(NAME) main.o
	echo $(NAME)
	gcc $^ -o test
	./test

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
.PHONY: all clean fclean re

