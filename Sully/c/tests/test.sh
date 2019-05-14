rm -f Sully* ; clang -Wall -Wextra -Werror ../Sully.c -o Sully ; ./Sully ; ls -al | grep Sully | wc -l ; diff Sully_5.c ../Sully.c
