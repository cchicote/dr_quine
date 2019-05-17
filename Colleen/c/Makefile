YELLOW="\033[01;33m"
GREEN="\033[01;32m"
CYAN="\033[01;36m"
NOCOLOR="\033[01;0m"

NAME=Colleen
SRC=Colleen.c

CFLAGS=-Wall -Werror -Wextra

all: $(NAME)

$(NAME):
	@printf $(CYAN)
	@printf "🔨 Compiling $(NAME) 🔨\n"
	@printf $(YELLOW)
	clang $(CFLAGS) -o $(NAME) $(SRC)
	@printf $(GREEN)
	@printf "✅ $(NAME) compiled! ✅\n\n"
	@printf $(NOCOLOR)

clean:
	@printf $(CYAN)
	@printf "🧹 Cleaning miscellaneous files 🧹\n"
	@printf $(YELLOW)
	/bin/rm -f Colleen_bis.c
	/bin/rm -f diff
	@printf $(GREEN)
	@printf "✅ $(NAME) removed! ✅\n\n"
	@printf $(NOCOLOR)

fclean: clean
	@printf $(CYAN)
	@printf "🧹 Removing $(NAME) 🧹\n"
	@printf $(YELLOW)
	/bin/rm -f $(NAME)
	@printf $(GREEN)
	@printf "✅ $(NAME) removed! ✅\n\n"
	@printf $(NOCOLOR)

re: fclean all

evaluate: re
	@printf $(CYAN)
	@printf "⏳ Executing tests on $(NAME) ⏳\n"
	@printf $(YELLOW)
	- ./$(NAME) > Colleen_bis.c
	- diff $(SRC) Colleen_bis.c > diff
	cat -e diff
	@printf $(GREEN)
	@printf "✅ $(NAME) tests executed! ✅\n\n"
	@printf $(NOCOLOR)

.PHONY: all clean fclean re evaluate
