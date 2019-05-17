YELLOW="\033[01;33m"
GREEN="\033[01;32m"
CYAN="\033[01;36m"
GREY="\033[01;37m"
NOCOLOR="\033[01;0m"

NAME=Sully
TEST_DIRECTORY=out
TEST_SCRIPT=evaluate.sh
SRC=Sully.s
OBJ=Sully.o

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
	/bin/mkdir $(TEST_DIRECTORY)
	ld $(OBJ) $(LFLAGS) -o $(TEST_DIRECTORY)/$(NAME)
	@printf $(GREEN)
	@printf "✅ $(NAME) linked! ✅\n\n"
	@printf $(NOCOLOR)

clean:
	@printf $(CYAN)
	@printf "🧹 Cleaning miscellaneous files 🧹\n"
	@printf $(YELLOW)
	/bin/rm -f $(OBJ)
	/bin/rm -f $(TEST_SCRIPT)
	/bin/rm -rf $(TEST_DIRECTORY)
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
	echo "cd $(TEST_DIRECTORY) ; ./$(NAME) ; rm -f Sully_*.o ; ls -la | grep $(NAME) | wc -l" > $(TEST_SCRIPT)
	@chmod 766 $(TEST_SCRIPT)
	@printf $(GREY)
	- ./$(TEST_SCRIPT)
	- diff $(SRC) $(TEST_DIRECTORY)/Sully_5.s
	- diff $(SRC) $(TEST_DIRECTORY)/Sully_0.s
	@printf $(GREEN)
	@printf "\n"
	@printf "✅ $(NAME) tests executed! ✅\n\n"
	@printf $(NOCOLOR)

.PHONY: all clean fclean re evaluate
