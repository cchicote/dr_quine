rm -rf Sully_* ; nasm -f macho64 ../Sully.s -o ../Sully.o ; ld ../Sully.o -macosx_version_min 10.8 -lSystem -o ../Sully ; ./../Sully
