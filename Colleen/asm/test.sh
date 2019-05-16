rm -f Colleen Colleen.o ; nasm -f macho64 Colleen.s -o Colleen.o ; ld Colleen.o -macosx_version_min 10.8 -lSystem -o Colleen ; ./Colleen 
