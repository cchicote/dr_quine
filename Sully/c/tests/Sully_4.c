#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
	int i = 4;
	if (i <= 0)
		return (-1);
	char filename[19];
	#ifdef NB
		i--;
	#endif
	sprintf(filename, "Sully_%d.c", i);
	int fd = open(filename, O_WRONLY | O_CREAT, 0755);
	if (fd < 0)
		return (-1);
	char *a = "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c%1$cint main()%1$c{%1$c%2$cint i = %6$d;%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn (-1);%1$c%2$cchar filename[19];%1$c%2$c#ifdef NB%1$c%2$c%2$ci--;%1$c%2$c#endif%1$c%2$csprintf(filename, %4$cSully_%7$cd.c%4$c, i);%1$c%2$cint fd = open(filename, O_WRONLY | O_CREAT, 0755);%1$c%2$cif (fd < 0)%1$c%2$c%2$creturn (-1);%1$c%2$cchar *a = %4$c%5$s%4$c;%1$c%2$cdprintf(fd, a, 10, 9, 47, 34, a, i, 37);%1$c%2$cchar command[86];%1$c%2$csprintf(command, %4$cclang -Wall -Wextra -Werror -D NB Sully_%7$c1$d.c -o Sully_%7$c1$d ; ./Sully_%7$c1$d%4$c, i);%1$c%2$csystem(command);%1$c%2$cclose(fd);%1$c}%1$c";
	dprintf(fd, a, 10, 9, 47, 34, a, i, 37);
	char command[86];
	sprintf(command, "clang -Wall -Wextra -Werror -D NB Sully_%1$d.c -o Sully_%1$d ; ./Sully_%1$d", i);
	system(command);
	close(fd);
}
