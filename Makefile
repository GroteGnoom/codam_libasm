NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
TEST = main.c
INC = libasm.h

CC=gcc
CFLAGS := -Wall -Wextra -Werror
ifdef DEBUG
	CFLAGS := $(CFLAGS) -g -fsanitize=address -fsanitize=undefined
endif

OS := $(shell uname)

ifeq ($(OS), Linux)
	AFLAGS = -felf64
	CFLAGS := $(CFLAGS) -no-pie
else
	AFLAGS = -fmacho64
endif

LIBOBJ = $(SRC:.s=.o)
OBJ = $(LIBOBJ) main.o

all: $(NAME)

$(NAME): $(LIBOBJ)
	ar r $@ $(LIBOBJ)

%.o: %.s $(INC)
	nasm $(AFLAGS) $<

main.o: main.c
	$(CC) $(CFLAGS) main.c -c -o main.o

test: main.o $(NAME)
	echo $(NAME)
	$(CC) $(CFLAGS) $^ -o test
	./test

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f test

re: fclean all
.PHONY: all clean fclean re test

.PRECIOUS: test

