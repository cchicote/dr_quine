# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchicote <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/01 19:09:21 by cchicote          #+#    #+#              #
#    Updated: 2019/03/11 19:05:30 by cchicote         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a
TEST_NAME = test
SRC_PATH = ./src/
TEST_PATH = ./tests/
OBJ_PATH = ./obj/
OBJ_TEST_PATH = ./obj_test/
ARCH = macho64

SRCS = ft_bzero.s \
	ft_strcat.s \
	ft_strlen.s \
	ft_isupper.s \
	ft_islower.s \
	ft_isalpha.s \
	ft_isdigit.s \
	ft_isalnum.s \
	ft_isascii.s \
	ft_isprint.s \
	ft_toupper.s \
	ft_tolower.s \
	ft_puts.s \
	ft_memset.s \
	ft_memcpy.s \
	ft_strdup.s \
	ft_cat.s \
	ft_memalloc.s \
	ft_memdel.s \
	ft_strnew.s \
	ft_strdel.s \
	ft_strclr.s \
	ft_cat_bis.s 
TEST_SRCS = test_bzero.c \
		test_strcat.c \
		test_strlen.c \
		test_isupper.c \
		test_islower.c \
		test_isalpha.c \
		test_isdigit.c \
		test_isalnum.c \
		test_isascii.c \
		test_isprint.c \
		test_toupper.c \
		test_tolower.c \
		test_puts.c \
		test_strdup.c \
		test_cat.c \
		test_memset.c \
		test_memcpy.c \
		test_memalloc.c \
		test_memdel.c \
		test_strnew.c \
		test_strdel.c \
		test_strclr.c \
		test_cat_bis.c
OBJ = $(SRCS:%.s=$(OBJ_PATH)%.o)
TEST_OBJ = $(TEST_SRCS:%.c=$(OBJ_TEST_PATH)%.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	mkdir -p $(OBJ_PATH)
	nasm -f $(ARCH) $< -o $@

clean: clean_test
	@ echo "Cleaning .o files"
	@ /bin/rm -Rf $(OBJ_PATH)

fclean: clean fclean_test
	@ echo "Cleaning $(NAME)"
	@ /bin/rm -f $(NAME)

$(OBJ_TEST_PATH)%.o: $(TEST_PATH)%.c
	@ mkdir -p $(OBJ_TEST_PATH)
	@ gcc -Wall -Werror -Wextra -o $@ -c $<

compil_test: $(NAME) $(TEST_OBJ)
	@ gcc -Wall -Werror -Wextra main.c -o $(TEST_NAME) $(TEST_OBJ) -L. -lfts 

test: compil_test
	@ ./$(TEST_NAME)

clean_test:
	@ /bin/rm -Rf $(OBJ_TEST_PATH)

fclean_test: clean_test
	@ /bin/rm -f $(TEST_NAME)

re_test: fclean_test test

re: fclean all

.PHONY: clean, fclean, re, all
