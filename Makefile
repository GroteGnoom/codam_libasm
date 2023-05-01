NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
TEST = main.c
INC = libasm.h

CC=gcc
#CFLAGS = -g -Wall -Wextra -Werror -O0
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
	rm -f test

re: fclean all
.PHONY: all clean fclean re test

.PRECIOUS: test

