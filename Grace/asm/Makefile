YELLOW="\033[01;33m"
GREEN="\033[01;32m"
CYAN="\033[01;36m"
GREY="\033[01;37m"
NOCOLOR="\033[01;0m"

NAME=Grace
KID=Grace_kid.s
SRC=Grace.s
OBJ=Grace.o

CFLAGS=-f macho64
LFLAGS=-macosx_version_min 10.8 -lSystem

all: $(NAME)

$(OBJ):
	@printf $(CYAN)
	@printf "🔨 Compiling $(OBJ) 🔨\n"
	@printf $(YELLOW)
	nasm $(CFLAGS) $(SRC) -o $(OBJ)
	@printf $(GREEN)
	@printf "✅ $(OBJ) compiled! ✅\n\n"
	@printf $(NOCOLOR)

$(NAME): $(OBJ)
	@printf $(CYAN)
	@printf "🔨 Linking $(NAME) 🔨\n"
	@printf $(YELLOW)
	ld $(OBJ) $(LFLAGS) -o $(NAME)
	@printf $(GREEN)
	@printf "✅ $(NAME) linked! ✅\n\n"
	@printf $(NOCOLOR)

clean:
	@printf $(CYAN)
	@printf "🧹 Cleaning miscellaneous files 🧹\n"
	@printf $(YELLOW)
	/bin/rm -f $(OBJ)
	/bin/rm -f $(KID)
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
	- ./$(NAME)
	- diff $(SRC) $(KID) > diff
	cat -e diff
	@printf $(GREY)
	ls -la
	@printf $(GREEN)
	@printf "✅ $(NAME) tests executed! ✅\n\n"
	@printf $(NOCOLOR)

.PHONY: all clean fclean re evaluate
