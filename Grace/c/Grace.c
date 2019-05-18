#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

#define NEWLINE 10
#define TAB 9
#define FT()int main(){int fd = open("Grace_kid.c", O_WRONLY | O_CREAT, 0644);if (fd < 0) return(-1);char *a = "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c%1$c#define NEWLINE 10%1$c#define TAB 9%1$c#define FT()int main(){int fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_CREAT, 0644);if (fd < 0) return(-1);char *a = %2$c%3$s%2$c;dprintf(fd, a, NEWLINE, 34, a, 47, TAB);close(fd);}%1$c%1$c%4$c*%1$c%5$ccommentaire%1$c*%4$c%1$c%1$cFT();%1$c";dprintf(fd, a, NEWLINE, 34, a, 47, TAB);close(fd);}

/*
	commentaire
*/

FT();
