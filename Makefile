NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s
TEST = main.c
INC = libasm.h

CC=clang
CFLAGS = -g -Wall -Wextra -Werror -fsanitize=address -O0

AFLAGS = -fmacho64

LIBOBJ = $(SRC:.s=.o)
OBJ = $(LIBOBJ) main.o

all: $(NAME)

$(NAME): $(LIBOBJ)
	ar r $@ $(LIBOBJ)

%.o: %.s $(INC)
	nasm $(AFLAGS) $<

main.o: main.c
	$(CC) $(CFLAGS) main.c -c -o main.o

test: $(NAME) main.o
	echo $(NAME)
	$(CC) $(CFLAGS) $^ -o test
	./test

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
.PHONY: all clean fclean re

.PRECIOUS: test

