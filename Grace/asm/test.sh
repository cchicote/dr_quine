rm -f Grace Grace.o Grace_kid.s ; nasm -f macho64 Grace.s -o Grace.o ; ld Grace.o -macosx_version_min 10.8 -lSystem -o Grace ; ./Grace ; diff Grace.s Grace_kid.s
